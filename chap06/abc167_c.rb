# 6.5 集合に対する全探索と動的計画法

N, M, X = gets.chomp.split.map(&:to_i)
prices = []
algo = []
N.times do
  a = gets.chomp.split.map(&:to_i)
  c = a.shift
  prices << c
  algo << a
end
ALL = 1 << N
INF = 10 ** 7
ans = INF

ALL.times do |n|
  scores = Array.new(M, 0)
  price = 0
  N.times do |i|
    if (n & (1 << i)) > 0
      price += prices[i]
      M.times do |j|
        scores[j] += algo[i][j]
      end
    end
  end
  if scores.min >= X
    ans = [ans, price].min
  end
end

ans = -1 if ans == INF

puts ans
