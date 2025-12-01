lines = File.readlines("input.txt")
start_value = 50

def solve_part_two(lines, current_value)
  zero_hits = 0
  
  lines.each do |l|
    l = l.strip
    direction = l[0]
    amount = l[1..-1].to_i
    step = (direction == "R") ? 1 : -1

    amount.times do
      current_value += step 
      current_value %= 100
      
      if current_value == 0
        zero_hits += 1
      end
    end
  end

  return zero_hits
end

puts solve_part_two(lines, start_value)
