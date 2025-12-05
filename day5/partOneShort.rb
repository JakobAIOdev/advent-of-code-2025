lines = File.readlines("input.txt", chomp: true)
idx = lines.index("")
ranges = lines[0...idx].map { |line| line.split('-').map(&:to_i) }
values = lines[(idx + 1)..].map(&:to_i)

count = values.count do |val|
  ranges.any? { |s, e| val >= s && val <= e }
end

puts count
