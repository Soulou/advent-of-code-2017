#!/usr/bin/env ruby

filename = "input"
input = File.new(filename)

input.readchar

def read_garbage file
  counter = 0
  ignore_next = false
  loop do
    c = file.readchar
    if ignore_next
      ignore_next = false
      next
    end

    case c
    when '!'
      ignore_next = true
    when '>'
      return counter
    else
      counter += 1
    end
  end
end

def read_group file, multiplicator
  garbage_counter = 0
  sum = 0
  loop do
    c = file.readchar
    case c
    when '{'
      s, g = read_group(file, multiplicator + 1)
      sum += s
      garbage_counter += g
    when '}'
      return sum + multiplicator, garbage_counter
    when '<'
      garbage_counter += read_garbage(file)
    end
  end
end

sum, garbage_counter = read_group input, 1
puts "Score: #{sum}"
puts "Garbage counter #{garbage_counter}"
