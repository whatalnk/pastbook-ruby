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

d = Array.new(N, -1)
q = [0]

d[0] = 0

while !q.empty?
  i = q.shift

  g[i].each do |j|
    if d[j] == -1
      d[j] = d[i] + 1
      q << j
    end
  end
end

if d[N - 1] == 2
  puts("POSSIBLE")
else
  puts("IMPOSSIBLE")
end
