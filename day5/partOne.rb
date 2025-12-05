file = File.readlines("input.txt");

def split_file(file)
  idx = file.index("\n")
  ranges = file[0...idx]
  values = file[(idx + 1)..]
  return values, ranges
end

def check_values(values, ranges)
  total = 0;
  values.each do |v|
    ranges.each do |r|
      idx = r.index("-")
      range_start = r[0...idx].to_i
      range_end = r[(idx + 1)..].to_i
      if (range_start..range_end) === v.to_i
        total += 1
        break
      end
    end
  end
  total
end

def check_fresh(file)
  file_split = split_file(file);
  puts file_split
  total = check_values(file_split[0], file_split[1])
  puts total
end

check_fresh(file)
