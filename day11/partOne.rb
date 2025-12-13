@graph = {}

File.foreach("input.txt") do |line|
  parts = line.strip.split(": ")
  
  device, outputs = parts
  @graph[device] = outputs.split(" ")
end

def count(current, goal)
  neighbors = @graph[current] || []

  neighbors.sum do |node| 
    if node == goal
      1
    else
      count(node, goal)
    end
  end
end

puts count('you', 'out')
