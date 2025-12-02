file = File.read("input.txt").split(',')

def repeated_block?(string)
  length = string.length

  (1..(length / 2)).each do |block_size|
    if length % block_size == 0
      repeats = length / block_size

      if repeats >= 2
        block = string[0, block_size]
        return true if block * repeats == string
      end
    end
  end

  false
end

def search_ids(file)
  amount = 0

  file.each do |line|
    parts = line.split("-")
    start_range = parts[0].to_i
    end_range   = parts[1].to_i

    (start_range..end_range).each do |number|
      string = number.to_s
      next if string.length < 2

      if repeated_block?(string)
        amount += number
      end
    end
  end

  amount
end

amount = search_ids(file)
puts amount
