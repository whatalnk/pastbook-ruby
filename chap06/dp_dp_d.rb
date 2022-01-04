# 6.4.3 多次元配列を用いた動的計画法
N, W = gets.chomp.split(" ").map(&:to_i)
ws = [0]
vs = [0]
N.times do
  w, v = gets.chomp.split(" ").map(&:to_i)
  ws << w
  vs << v
end

value = Array.new(N + 1) { Array.new(W + 1, -10 ** 18) }
value[0][0] = 0
1.upto(N) do |i|
  0.upto(W) do |w|
    value[i][w] = [value[i][w], value[i - 1][w]].max
    if w - ws[i] >= 0
      value[i][w] = [value[i][w], value[i - 1][w - ws[i]] + vs[i]].max
    end
  end
end

ans = value[N].max
puts ans
