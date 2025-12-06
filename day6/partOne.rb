lines = File.read("input.txt").each_line(chomp: true).to_a
rows = lines.length
cols = lines.map(&:length).max
grid = Array.new(rows) { |r| lines[r].ljust(cols, ' ').chars }
ops_row = rows - 1

blank = Array.new(cols) do |c|
  all_blank = true
  rows.times do |r|
    if grid[r][c] != ' '
      all_blank = false
      break
    end
  end
  all_blank
end

problems = []
start = nil
cols.times do |c|
  if blank[c]
    if start
      problems << [start, c - 1]
      start = nil
    end
  else
    start ||= c
  end
end
problems << [start, cols - 1] if start

total = 0

problems.each do |start_col, end_col|
  op = nil
  (start_col..end_col).each do |c|
    ch = grid[ops_row][c]
    if ch == '+' || ch == '*'
      op = ch
      break
    end
  end
  next unless op

  nums = []
  0.upto(ops_row - 1) do |r|
    digits = ""
    (start_col..end_col).each do |c|
      ch = grid[r][c]
      digits << ch if ch >= '0' && ch <= '9'
    end
    nums << digits.to_i unless digits.empty?
  end

  if op == '+'
    value = nums.sum
  else
    value = nums.inject(1) { |acc, n| acc * n }
  end
  total += value
end

puts total
