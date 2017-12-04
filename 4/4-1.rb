#!/usr/bin/env ruby

input = File.read("input")

valids = 0

input.each_line do |line|
  line = line.split(" ").sort
  len = line.length
  Rk = true

  line.each_with_index do |word, i|
    p = line[i-1] if i > 0
    n = line[i+1] unless i == len - 1

    if word == p || word == n
      ok = false
      break
    end
  end

  valids += 1 if ok
end

puts valids
