#!/usr/bin/env ruby

input = File.read("input").strip
len = input.length
sum = 0

(0...len).each do |i|
  c1 = input[i]
  c2 = input[(i+1) % len]

  i1 = c1.to_i
  i2 = c2.to_i

  if i1 == i2
    sum += i1
  end
end

puts sum
