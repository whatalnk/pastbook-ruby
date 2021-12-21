n = gets.chomp.to_i
x = 1
cnt = 0
while true
  if x < 10
    cnt += 1
  else
    if x.to_s.split("").uniq.size == 1
      cnt += 1
    end
  end

  if cnt == n
    puts(x)
    exit
  end

  x += 1
end
