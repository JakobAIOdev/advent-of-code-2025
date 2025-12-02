file = File.read("input.txt").split(',')

def search_ids(file)
  amount = 0

  file.each do |l|
    start_range = l.split("-")[0].to_i
    end_range   = l.split("-")[1].to_i
    puts "#{start_range} / #{end_range}"

    (start_range..end_range).each do |c|
      str = c.to_s

      next unless str.size.even? && str.size > 1

      first, second = str.chars.each_slice(str.length / 2).map { |a| a.join.to_i }

      amount += c if first == second
    end
  end

  amount
end

amount = search_ids(file)
puts amount
