# 6.6 数学的問題
N = gets.chomp.to_i
ans = 0

1.upto(N - 1) do |a|
  b_cnt = (N - 1) / a
  ans += b_cnt
end

puts(ans)
