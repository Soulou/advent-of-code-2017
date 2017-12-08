#!/usr/bin/env ruby

input = File.read("input")

registers = {}
max = 0

input.each_line do |line|
  s = line.split
  r = s[0]
  op = s[1]
  v = s[2].to_i

  rif = s[4]
  opif = s[5]
  vif = s[6].to_i

  registers[r] ||= 0
  registers[rif] ||= 0

  case op
  when "inc"
    op = :+
  when "dec"
    op = :-
  end

  if registers[rif].send(:"#{opif}", vif)
    registers[r] = registers[r].send(op, v)
  end
  if registers.values.max > max
    max = registers.values.max
  end
end

puts max


