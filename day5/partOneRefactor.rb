file = File.readlines("input.txt", chomp: true)

def split_file(lines)
  idx = lines.index("")
  ranges = lines[0...idx]
  values = lines[(idx + 1)..]
  [values, ranges]
end

def parse_range(line)
  start_str, end_str = line.split("-", 2)
  (start_str.to_i..end_str.to_i)
end

def check_values(values, range_lines)
  ranges = range_lines.map { |line| parse_range(line) }

  values.count do |v|
    val = v.to_i
    ranges.any? { |range| range.include?(val) }
  end
end

def run(file)
  values, ranges = split_file(file)
  total = check_values(values, ranges)
  puts total
end

run(file)
