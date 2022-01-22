# 二分探索

A, B, X = gets.chomp.split(" ").map(&:to_i)

N_MAX = 10 ** 9

ans = (1..N_MAX).bsearch { |x| A * x + B * x.to_s.length > X }

if ans.nil?
  puts(N_MAX)
else
  puts(ans - 1)
end
