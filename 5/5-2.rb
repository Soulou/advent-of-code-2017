#!/usr/bin/env ruby

input = File.read("input").split("\n").map(&:to_i)

ip = 0
steps = 0

while ip < input.length
  steps += 1

  prev = ip
  ip += input[ip]

  if input[prev] >= 3
    input[prev] -= 1
  else
    input[prev] += 1
  end
end

puts "IP: #{ip}, Steps: #{steps}"
