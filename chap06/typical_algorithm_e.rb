INF = 1_000_000_000_000_000_000
N, M = gets.chomp.split(" ").map(&:to_i)
dist = Array.new(N) { Array.new(N, INF) }

M.times do
  u, v, c = gets.chomp.split(" ").map(&:to_i)
  dist[u][v] = c
end

N.times do |i|
  dist[i][i] = 0
end

N.times do |k|
  N.times do |x|
    N.times do |y|
      dist[x][y] = [dist[x][y], dist[x][k] + dist[k][y]].min
    end
  end
end

ans = 0

N.times do |i|
  N.times do |j|
    ans += dist[i][j]
  end
end

puts(ans)
