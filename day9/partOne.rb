points = File.readlines("input.txt", chomp: true).map do
  |line| line.split(",").map { |x| x.to_i } 
end

max = 0

points.each_with_index do |point, index|
  x1, y1 = point

  points[0...index].each_with_index do |point2, index2|
    next if index == index2
    x2, y2 = point2

    width = (x1 - x2).abs + 1
    height = (y1 - y2).abs + 1
    area = width * height

    if area > max
      max = area
    end
  end
end

puts max
