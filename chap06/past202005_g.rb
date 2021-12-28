n, x, y = gets.chomp.split(" ").map(&:to_i)
x += 200
y += 200

m = Array.new(500) { Array.new(500, ".") }
d = Array.new(500) { Array.new(500, -1) }

n.times do
  xi, yi = gets.chomp.split(" ").map(&:to_i)
  xi += 200
  yi += 200
  m[yi][xi] = "#"
end

dxdy = [[1, 1], [0, 1], [-1, 1], [1, 0], [-1, 0], [0, -1]]

que = []
d[200][200] = 0
que << [200, 200]

while que.size > 0
  cx, cy = que.shift

  dxdy.each do |dx, dy|
    nx, ny = cx + dx, cy + dy

    if nx >= 0 && nx < 500 && ny >= 0 && ny < 500 && m[ny][nx] != "#" && d[ny][nx] == -1

      d[ny][nx] = d[cy][cx] + 1
      que << [nx, ny]
    end
  end
end

puts(d[y][x])
