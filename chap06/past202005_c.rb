# 6.6 数学的問題
A, R, N = gets.chomp.split(" ").map(&:to_i)

num = A * (R ** (N - 1))

if num > 10 ** 9
  puts("large")
else
  puts(num)
end
