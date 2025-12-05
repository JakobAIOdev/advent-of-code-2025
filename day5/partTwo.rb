ranges = File.readlines("input.txt", chomp: true)
  .take_while { |line| line != "" }
  .map { |line| line.split('-').map(&:to_i) }
  .sort

merged = []
ranges.each do |start, end_val|
  if merged.empty? || start > merged[-1][1]
    merged << [start, end_val]
  else
    merged[-1][1] = [merged[-1][1], end_val].max
  end
end

puts merged.sum { |start, end_val| end_val - start + 1 }
