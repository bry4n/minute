require File.expand_path("../spec_helper", __FILE__)

describe Minute do

  before do
    @current_time = Time.now
  end

  it "parses 'last year'" do
    time = Minute.parse("last year", :now => @current_time)
    assert_equal time, (@current_time - 1.year)
  end

  it "parses 'last month'" do
    time = Minute.parse("last month", :now => @current_time)
    assert_equal time, (@current_time - 1.month)
  end

  it "parses 'last week'" do
    time = Minute.parse("last week", :now => @current_time)
    assert_equal time, (@current_time - 1.week)
  end

  it "parses 'last day'" do
    time = Minute.parse("last day", :now => @current_time)
    assert_equal time, (@current_time - 1.day)
  end

  it "parses 'last hour'" do
    time = Minute.parse("last hour", :now => @current_time)
    assert_equal time, (@current_time - 1.hour)
  end

  it "parses 'last minute'" do
    time = Minute.parse("last minute", :now => @current_time)
    assert_equal time, (@current_time - 1.minute)
  end

  it "parses 'last minute'" do
    time = Minute.parse("last second", :now => @current_time)
    assert_equal time, (@current_time - 1.second)
  end


end
