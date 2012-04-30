$:.unshift "lib"

require 'minute'
require 'timecop'
require 'minitest/autorun'

Timecop.freeze(Time.now)
