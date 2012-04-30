$:.unshift "lib"

require 'minute'
require 'chronic'
require 'benchmark'

def run(n)
  n.to_i.times do
    yield
  end
end

Benchmark.bm(20) do |b|
  b.report("minute") do
    run 100_000 do
      Minute.parse("December 3 2011")
    end
  end
  b.report("chronic") do
    run 100_000 do
      Chronic.parse("December 3 2011")
    end
  end
end

