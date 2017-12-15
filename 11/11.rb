#!/usr/bin/env ruby

input = File.read("input").split(",").map(&:strip)

directions = {}

input.each do |i|
  directions[i] ||= 0
  directions[i] += 1
end

copy = {}
while copy != directions
  copy = directions.clone
  [["ne","sw"], ["n", "s"], ["nw", "se"],
   ["ne", "s", "se"], ["nw", "s", "sw"],
   ["se", "n", "ne"], ["sw", "n", "nw"],
   ["sw", "se", "s"], ["nw", "ne", "n"]].each do |tuple|
    d1 = directions[tuple[0]]
    d2 = directions[tuple[1]]
    if d1 && d1 > 0 &&
       d2 && d2 > 0
      min = [d1, d2].min
      directions[tuple[0]] -= min
      directions[tuple[1]] -= min
      if tuple[2]
        directions[tuple[2]] ||= 0
        directions[tuple[2]] += min
      end
    end
  end
end


puts directions

sum = directions.values.sum
puts sum
