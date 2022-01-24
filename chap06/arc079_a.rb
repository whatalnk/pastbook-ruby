# 最短路問題
N, M = gets.chomp.split(" ").map(&:to_i)

g = Array.new(N) { Array.new }

M.times do
  a, b = gets.chomp.split(" ").map(&:to_i)
  a -= 1
  b -= 1
  g[a] << b
  g[b] << a
end
