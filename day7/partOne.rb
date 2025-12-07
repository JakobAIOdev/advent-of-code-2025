grid = File.read("input.txt").each_line(chomp: true).map(&:chars)

def solve(grid)
  split = 0

  grid.each_with_index do |row, nrow|
    0.upto(row.length - 1) do |ncol|
      next if nrow == 0

      if ["|", "S"].include?(grid[nrow - 1][ncol])
        if row[ncol] == "^"
          row[ncol - 1] = "|" if ncol - 1 >= 0
          row[ncol + 1] = "|" if ncol + 1 < row.length
          split += 1
        elsif row[ncol] == "."
          row[ncol] = "|"
        end
      end
    end
  end

  split
end

p solve(grid)
