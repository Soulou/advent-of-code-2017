#!/usr/bin/env ruby

require "pry"

input = File.read "input"

items = {}
input.each_line do |line|
  s = line.split
  name = s[0]
  weight = s[1].gsub(%r{\(|\)}, "")
  children = (s[3..-1] || []).map{|c| c.gsub(",", "")}
  items[name] = {
    weight: weight,
    children_name: children
  }
end

items.each do |name, attrs|
  next if attrs[:children_name].length == 0
  attrs[:children_name].each do |n|
    items[n][:parent] = name
  end
end

# End of parsing and building of the tree
# Now: finding the root

items.each do |name, attrs|
  if attrs[:parent].nil?
    puts name
  end
end
