#!/usr/bin/env ruby

input = File.read("input")

sum = 0

input.each_line do |line|
  numbers = line.strip.split(" ").map(&:to_i).sort.reverse
  len = numbers.length

  numbers.each_with_index do |n1, i|
    found = false
    (i+1...len).each do |j|
      if n1 % numbers[j] == 0
        sum += n1 / numbers[j]
        found = true
        break
      end
    end
    break if found
  end
end

puts sum
