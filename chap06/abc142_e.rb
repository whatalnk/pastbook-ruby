# 6.5.3
N, M = gets.chomp.split(" ").map(&:to_i)
s = [0]
c = [0]
M.times do
  a, b = gets.chomp.split(" ").map(&:to_i)
  cs = gets.chomp.split(" ").map(&:to_i)
  s_val = 0
  cs.each do |cc|
    s_val |= (1 << (cc - 1))
  end
  s << s_val
  c << a
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
