lines = File.readlines("input.txt")
start_value = 50

def solve_dial(lines, current_value)
  zero_hits = 0
  
  lines.each do |l|
    l = l.strip
    
    direction = l[0]
    amount = l[1..-1].to_i

    if direction == "R"
      current_value += amount
    elsif direction == "L"
      current_value -= amount
    end

    current_value %= 100
    
    if current_value == 0
      zero_hits += 1
    end
  end

  return zero_hits
end

puts solve_dial(lines, start_value)
