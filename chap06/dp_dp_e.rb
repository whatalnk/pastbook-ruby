# 6.4.3 多次元配列を用いた動的計画法
N, W = gets.chomp.split(" ").map(&:to_i)
ws = [0]
vs = [0]
N.times do
  w, v = gets.chomp.split(" ").map(&:to_i)
  ws << w
  vs << v
end
VMAX = 100000
INF = 10 ** 18
weights = Array.new(N + 1) { Array.new(VMAX + 1, INF) }
weights[0][0] = 0
1.upto(N) do |i|
  0.upto(VMAX) do |v|
    weights[i][v] = [weights[i][v], weights[i - 1][v]].min
    if v - vs[i] >= 0
      weights[i][v] = [weights[i][v], weights[i - 1][v - vs[i]] + ws[i]].min
    end
  end
end

ans = 0.upto(VMAX).filter { |v| weights[N][v] <= W }.max
puts ans
