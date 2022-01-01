N = gets.chomp.to_i
@cnt = 0
que = []
1.upto(9) do |i|
  que << i
end
while que.size > 0
  n = que.shift
  @cnt += 1
  if @cnt == N
    puts n
    exit
  end
  r = n % 10
  if r - 1 >= 0
    que << 10 * n + r - 1
  end
  que << 10 * n + r
  if r + 1 <= 9
    que << 10 * n + r + 1
  end
end
