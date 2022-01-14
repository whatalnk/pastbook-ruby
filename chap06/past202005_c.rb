# 6.6 数学的問題
A, R, N = gets.chomp.split(" ").map(&:to_i)

if R == 1
  num = A * (R ** (N - 1))
else
  num = A

  (N - 1).times do
    num *= R
    break if num > 10 ** 9
  end
end

if num > 10 ** 9
  puts("large")
else
  puts(num)
end
