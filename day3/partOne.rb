file = File.readlines("input.txt");

def activateBateries(file, total = 0)
  file.each do |line|
    max = 0;
    sec_max = 0;
    index_max = 0;
    line.each_char.with_index(1) do |char, index|
      if char.to_i > max && index != line.length - 1
        max = char.to_i
        index_max = index;
      end
    end

    (index_max..line.length).each do |c|
      if line[c].to_i > sec_max
        sec_max = line[c].to_i
      end
    end
    total += (max.to_s + sec_max.to_s).to_i
  end
  total
end

total = activateBateries(file)
puts total