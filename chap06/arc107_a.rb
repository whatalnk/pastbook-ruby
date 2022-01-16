# 6.6 数学的問題
A, B, C = gets.chomp.split(" ").map(&:to_i)

a = A * (A + 1) / 2
b = B * (B + 1) / 2
c = C * (C + 1) / 2
puts((a * b * c) % 998244353)
