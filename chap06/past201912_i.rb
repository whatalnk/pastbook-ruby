# 6.5.3 集合を状態とする動的計画法

N, M = gets.chomp.split(" ").map(&:to_i)

s = [0]
c = [0]
M.times do |i|
  ss, cc = gets.chomp.split(" ")
  s_val = 0
  N.times do |j|
    if ss[j] == "Y"
      s_val |= (1 << j)
    end
  end
  s << s_val
  c << cc.to_i
end

ALL = 1 << N

INF = 10 ** 100
cost = Array.new(M + 1) { Array.new(ALL, INF) }
cost[0][0] = 0

1.upto(M) do |i|
  ALL.times do |n|
    cost[i][n] = [cost[i][n], cost[i - 1][n]].min
    cost[i][n | s[i]] = [cost[i][n | s[i]], cost[i - 1][n] + c[i]].min
  end
end

ans = cost[M][ALL - 1]
ans = -1 if ans == INF
puts ans
