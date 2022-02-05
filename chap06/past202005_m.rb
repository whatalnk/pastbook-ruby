N, M = gets.chomp.split(" ").map(&:to_i)

edges = Array.new(N) { Array.new }

M.times do
  u, v = gets.chomp.split(" ").map(&:to_i)
  edges[u - 1] << v - 1
  edges[v - 1] << u - 1
end

S = gets.chomp.to_i - 1
K = gets.chomp.to_i
t = gets.chomp.split(" ").map { |x| x.to_i - 1 }
t << S

dist = []
INF = 10 ** 100

t.each do |t1|
  d = Array.new(N, INF)
  que = []
  que << t1
  d[t1] = 0
  while que.size > 0
    i = que.shift

    edges[i].each do |j|
      if d[j] == INF
        d[j] = d[i] + 1
        que << j
      end
    end
  end

  res = []

  t.each do |t2|
    res << d[t2]
  end

  dist << res
end

ALL = 1 << K
cost = Array.new(ALL) { Array.new(K, INF) }

K.times do |i|
  cost[1 << i][i] = dist[K][i]
end

def has_bit(n, i)
  return (n & (1 << i) > 0)
end

ALL.times do |n|
  K.times do |i|
    K.times do |j|
      if has_bit(n, j) || i == j
        next
      end

      cost[n | (1 << j)][j] = [cost[n | (1 << j)][j], cost[n][i] + dist[i][j]].min
    end
  end
end

puts(cost[ALL - 1].min)
