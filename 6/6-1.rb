#!/usr/bin/env ruby

input = File.read("input").split.map(&:to_i)
hashes = [input.hash]
hash = nil

loop do
  max = input[0]
  imax = 0
  (1...input.length).each do |i|
    if input[i] > max
      max = input[i]
      imax = i
    end
  end
  input[imax] = 0

  i = imax
  (1..max).each do
    i = (i + 1) % input.length
    input[i] += 1
  end

  hash = input.hash
  if hashes.include?(hash)
    break
  else
    hashes << hash
  end
end

puts hashes.length
puts hashes.length - hashes.index(hash)
