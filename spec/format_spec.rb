require File.expand_path("../spec_helper", __FILE__)

describe Minute do

  it "parses '9-11-2011'" do
    time = Minute.parse("1-11-2011")
    assert_equal time.month, 11
    assert_equal time.year, 2011
  end

  it "parses '3rd Dec'" do
    time = Minute.parse("3rd Dec")
    assert_equal time.month, 12
    assert_equal time.year, Time.now.year
  end

  it "parses 'Dec 3 2001'" do
    time = Minute.parse("Dec 3 2001")
    assert_equal time.month, 12
    assert_equal time.year, 2001
  end
end
