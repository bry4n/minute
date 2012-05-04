require 'small'
# Public: Minute is a natural language Date/Time parsing for Ruby Library
#
# Examples:
#
#   require 'minute'
#
#   Minute.parse("Hi I am Ruby I was born on Feb 24, 1993.")
#
#   Minute.parse("I came back from May 13, 2025", now: (Time.now + 23.years))
#
class Minute

  VERSION = "0.1"

  MONTHS  = Date::MONTHNAMES.zip(Date::ABBR_MONTHNAMES).flatten.compact.map(&:downcase).freeze
  DAYS    = Date::DAYNAMES.zip(Date::ABBR_DAYNAMES).flatten.compact.map(&:downcase).freeze
  
  DATE_WITH_ORDINAL   = /(\d{1,2})(st|nd|rd|th)?\s+(#{MONTHS.join("|")})(\s+\d{4})?/
  ENGLISH_DATE        = /(#{MONTHS.join("|")}),?\s(\d{1,2})(\s+\d{4})?/
  DATE                = /(\d{1,4})-?(\d{1,4})-?(\d{1,4})?/
  TIME                = /(\d{1,2}:\d{1,2})(:\d{1,2})?\s+?(am|pm)/i

  # Public: Create a match pattern to capture date/time strings.
  #
  # Examples:
  #
  #   match "tomorrow", lambda {|time| time + 1.day}
  #
  #   match "yesterday" do |time|
  #     time - 1.day
  #   end
  #
  # Returns Hash of match patterns.
  def self.match(pattern, block = nil, &blk)
    patterns.merge!({pattern => (block ? block : blk)})
  end

  # Public: parse the String to capture Date/Time
  #
  # Examples:
  #
  #   Minute.parse("tomorrow")
  #
  # Returns an instance of Time
  def self.parse(text, options = {})
    obj = new(options)
    obj.parse_string(text.to_s.downcase.strip)
  end

  def self.patterns
    @patterns ||= {}
  end

  attr_reader :now, :current_time

  def initialize(options = {})
    @now          = options[:now] || Time.now
    @current_time = @now
  end

  def parse_string(text)
    patterns.keys.each do |pattern|
      begin
        if pattern.is_a?(Regexp) && text =~ pattern
          @now = patterns[pattern].call(current_time, Regexp.last_match)
        elsif pattern.is_a?(String) && text.include?(pattern)
          @now = patterns[pattern].call(current_time)
        end
      rescue
        @now
      end
    end
    @now
  end

  def patterns
    @patterns ||= self.class.patterns
  end

  match 'tomorrow',     lambda {|time| time + 1.day }
  match 'yesterday',    lambda {|time| time - 1.day }
  match 'today',        lambda {|time| time }
  
  match /(beginning|end)\s+of\s+(year|month|week|day)/,  lambda {|time,m| time.send(:"#{m[1]}_of_#{m[2]}") }

  match /(last|next|\d+)\s+(year|month|week|day|hour|minute|second)s?(\s+ago)?/ do |time, m|
    case m[1]
    when "next" then time + 1.send(m[2].to_sym)
    when "last" then time - 1.send(m[2].to_sym)
    when /\d+/
      if !m[3].nil?
        time - m[1].to_i.send(m[2].to_sym)
      else
        time + m[1].to_i.send(m[2].to_sym)
      end
    end
  end

  match DATE,               lambda {|time, m| Time.parse(m[1..-1].compact.join("-")) }
  match ENGLISH_DATE,       lambda {|time, m| Time.parse(m[1..-1].compact.join(" ")) }
  match DATE_WITH_ORDINAL,  lambda {|time, m| Time.parse(m[1..-1].compact.join(" ")) }
  match TIME,               lambda {|time, m| Time.parse(m[1..-1].compact.join) }

  # TODO
  # this december
  # last december
  # next jan 13
  # every wed
  # this morning
  # tonight
  # between 8pm and 3pm
  # 3pm to 5pm
  # dec 13 to dec 14
  #
end

