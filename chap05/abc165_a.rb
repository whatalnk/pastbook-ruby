k = gets.chomp.to_i
a, b = gets.chomp.split(" ").map(&:to_i)
n = k
while true
  break if n > b

  if n >= a && n <= b
    puts("OK")
    exit
  end

  n += k
end

puts("NG")
