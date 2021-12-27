r, c = gets.chomp.split(" ").map(&:to_i)
sy, sx = gets.chomp.split(" ").map(&:to_i)
sy -= 1
sx -= 1
gy, gx = gets.chomp.split(" ").map(&:to_i)
gy -= 1
gx -= 1

m = []

r.times do
  m << gets.chomp.split("")
end

visited = Array.new(r) { Array.new(c, -1) }

que = []
que << [sy, sx]
visited[sy][sx] = 0

d = [[-1, 0], [0, 1], [1, 0], [0, -1]]
while que.size > 0
  y, x = que.shift

  d.each do |dy, dx|
    ny, nx = y + dy, x + dx

    if ny >= 0 && ny < r && nx >= 0 && nx < c && m[ny][nx] != "#" && visited[ny][nx] == -1
      visited[ny][nx] = visited[y][x] + 1
      que << [ny, nx]
    end
  end
end

puts(visited[gy][gx])
