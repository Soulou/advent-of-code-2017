#!/usr/bin/env ruby

def create_data max
  base = Math.sqrt(max).round / 2
  data = []
  i = base
  j = base
  v = 1

  data[i] ||= []
  data[i][j] = v
  direction = "R"
  circle = 1

  while v < max
    v += 1

    case direction
    when "R"
      i += 1
      if base + circle == i
        direction = "U"
        circle += 1
      end
    when "U"
      j += 1
      direction = "L" if i == j
    when "L"
      i -= 1
      direction = "D" if base - circle + 1 == i
    when "D"
      j -= 1
      direction = "R" if i == j
    end

    data[i] ||= []
    data[i][j] = v
  end

  return data, [(base - i).abs, (base - j).abs]
end

input = File.read("input").to_i

data, dist = create_data(input)

puts "DIST: #{dist.inspect} -> #{dist[0] + dist[1]}"

# data.each do |p|
#   next if p.nil?
#   p.each do |i|
#     next if i.nil?
#     printf "%4d ", i
#   end
#   puts
# end
