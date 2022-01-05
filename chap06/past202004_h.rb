# 6.4.4 計算する順番を工夫する動的計画法
N, M = gets.chomp.split(" ").map(&:to_i)

g = []
N.times do
  g << gets.chomp.split("")
end

group = Array.new(11) { Array.new() }
N.times do |i|
  M.times do |j|
    if g[i][j] == "S"
      n = 0
    elsif g[i][j] == "G"
      n = 10
    else
      n = g[i][j].to_i
    end
    group[n] << [i, j]
  end
end

INF = 10 ** 100
cost = Array.new(N) { Array.new(M, INF) }

si, sj = group[0][0]
cost[si][sj] = 0

1.upto(10) do |n|
  group[n].each do |i, j|
    group[n - 1].each do |ii, jj|
      cost[i][j] = [cost[i][j], cost[ii][jj] + (i - ii).abs + (j - jj).abs].min
    end
  end
end

gi, gj = group[10][0]
ans = cost[gi][gj]
if ans == INF
  ans = -1
end
puts ans
