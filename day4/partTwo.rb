file = File.readlines("input.txt")

def build_grid(lines)
  lines.map { |l| l.strip.chars }
end

NEIGHBOR_OFFSETS = [
  [-1,  0], [1,  0],
  [ 0, -1], [0,  1],
  [-1, -1], [-1, 1],
  [ 1, -1], [ 1, 1]
]

def count_at_neighbors(grid, i, j)
  h = grid.length
  w = grid[0].length
  count = 0

  NEIGHBOR_OFFSETS.each do |di, dj|
    ni = i + di
    nj = j + dj
    next if ni < 0 || nj < 0 || ni >= h || nj >= w
    count += 1 if grid[ni][nj] == "@"
  end
  count
end

def part2(lines)
  grid = build_grid(lines)
  h = grid.length
  w = grid[0].length
  total_removed = 0

  loop do
    to_remove = []

    (0...h).each do |i|
      (0...w).each do |j|
        next unless grid[i][j] == "@"
        to_remove << [i, j] if count_at_neighbors(grid, i, j) < 4
      end
    end

    break if to_remove.empty?

    to_remove.each do |i, j|
      grid[i][j] = "."
    end
    total_removed += to_remove.size
  end
  total_removed
end

puts part2(file)
