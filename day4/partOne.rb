file = File.readlines("input.txt")

def build_grid(lines)
  lines.map { |l| l.strip.chars }
end

def check_neighbors(lines)
  amount = 0
  grid = build_grid(lines)
  grid.each_with_index do |sub_line, i|
    sub_line.each_with_index do |item, j|
      next unless item == "@"

      if check_around?(grid, i, j)
        puts "match at (#{i}, #{j})"
        amount += 1
      end
    end
  end
  amount
end

def check_around?(grid, i, j)
  h = grid.length
  w = grid[0].length

  neighbor_offsets = [
    [-1,  0], [1,  0],
    [ 0, -1], [0,  1],
    [-1, -1], [-1, 1],
    [ 1, -1], [ 1, 1]
  ]

  at_neighbors = 0

  neighbor_offsets.each do |di, dj|
    ni = i + di
    nj = j + dj

    next if ni < 0 || nj < 0 || ni >= h || nj >= w

    at_neighbors += 1 if grid[ni][nj] == "@"
  end
  at_neighbors < 4
end

puts check_neighbors(file)
