#!/usr/bin/env ruby

input = File.read("input")

sum = 0

input.each_line do |line|
  numbers = line.strip.split(" ").map(&:to_i)
  sum += numbers.max - numbers.min
end

puts sum
