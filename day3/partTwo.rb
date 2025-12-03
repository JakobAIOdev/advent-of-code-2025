DIGITS = 12

def max_joltage_12(line)
  digits = []
  start = 0
  ending = line.length - DIGITS

  DIGITS.times do
    max_char = '0'
    max_idx = start
    (start..ending).each do |i|
      if line[i] > max_char
        max_char = line[i]
        max_idx = i
      end
    end

    digits << max_char
    start = max_idx + 1
    ending += 1
  end

  digits.join.to_i
end

def activateBatteriesPart2(file)
  file.sum { |line| max_joltage_12(line.strip) }
end

file = File.readlines("input.txt")
total = activateBatteriesPart2(file)
puts total
