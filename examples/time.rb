$:.unshift "lib"

require 'minute'

p Minute.parse("Guys we have a meeting tomorrow")
p Minute.parse("Don't wait for next year")
p Minute.parse("RubyConf sold 1000 tickets on June 29 2001")
p Minute.parse("Come to my house on 1 Jan 2001")
p Minute.parse("Homework due on 2011-11-3")
p Minute.parse("next Tuesday")
p Minute.parse("homework due by the end of day")
p Minute.parse("give me by the end of month")
p Minute.parse("8:30 AM")
