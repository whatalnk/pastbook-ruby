# 6.5.3 集合を状態とする動的計画法

N = gets.chomp.to_i
a = []

N.times do
  a << gets.chomp.split(" ").map(&:to_i)
end

ALL = 1 << N
INF = 10 ** 100
cost = Array.new(ALL) { Array.new(N, INF) }
cost[0][0] = 0

def has_bit(n, i)
  return n & (1 << i) > 0
end

ALL.times do |n|
  N.times do |i|
    N.times do |j|
      next if has_bit(n, j) || i == j
      cost[n | (1 << j)][j] = [cost[n | (1 << j)][j], cost[n][i] + a[i][j]].min
    end
  end
end

puts(cost[ALL - 1][0])
