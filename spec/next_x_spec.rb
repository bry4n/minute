require File.expand_path("../spec_helper", __FILE__)

describe Minute do

  before do
    @current_time = Time.now
  end

  it "parses 'next year'" do
    time = Minute.parse("next year", :now => @current_time)
    assert_equal time, (@current_time + 1.year)
  end

  it "parses 'next month'" do
    time = Minute.parse("next month", :now => @current_time)
    assert_equal time, (@current_time + 1.month)
  end

  it "parses 'next week'" do
    time = Minute.parse("next week", :now => @current_time)
    assert_equal time, (@current_time + 1.week)
  end

  it "parses 'next day'" do
    time = Minute.parse("next day", :now => @current_time)
    assert_equal time, (@current_time + 1.day)
  end

  it "parses 'next hour'" do
    time = Minute.parse("next hour", :now => @current_time)
    assert_equal time, (@current_time + 1.hour)
  end

  it "parses 'next minute'" do
    time = Minute.parse("next minute", :now => @current_time)
    assert_equal time, (@current_time + 1.minute)
  end

  it "parses 'next minute'" do
    time = Minute.parse("next second", :now => @current_time)
    assert_equal time, (@current_time + 1.second)
  end


end
