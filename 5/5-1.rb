#!/usr/bin/env ruby

input = File.read("input").split("\n").map(&:to_i)

ip = 0
steps = 0

while ip < input.length
  steps += 1

  prev = ip
  ip += input[ip]
  input[prev] += 1
end

puts "IP: #{ip}, Steps: #{steps}"
