#!/usr/bin/env ruby

require "pry"

input = File.read "input"

items = {}
input.each_line do |line|
  s = line.split
  name = s[0]
  weight = s[1].gsub(%r{\(|\)}, "").to_i
  children = (s[3..-1] || []).map{|c| c.gsub(",", "")}
  items[name] = {
    weight: weight,
    children: children
  }
end

items.each do |name, attrs|
  next if attrs[:children].length == 0
  attrs[:children].each do |n|
    items[n][:parent] = name
  end
end

# End of parsing and building of the tree
# Now: finding the root

root = nil
items.each do |name, attrs|
  if attrs[:parent].nil?
    root = name
    break
  end
end

def weight items, node, level
  w = node[:weight]
  if node[:children].length > 0
    cw = node[:children].map{|c| weight(items, items[c], level+1)}
    w += cw.sum
    puts "#{w} = #{node[:weight]} + #{cw.inspect}"
  end
  return w
end

weight(items, items[root], 0)
# items[root][:children].each do |c|
#   puts weight(items, items[c], 1)
# end
