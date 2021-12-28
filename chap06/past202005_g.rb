offset = 250

n, x, y = gets.chomp.split(" ").map(&:to_i)
x += offset
y += offset

sx = offset
sy = offset

m = Array.new(500) { Array.new(500, ".") }
d = Array.new(500) { Array.new(500, -1) }

n.times do
  xi, yi = gets.chomp.split(" ").map(&:to_i)
  xi += offset
  yi += offset
  m[xi][yi] = "#"
end

dxdy = [[1, 1], [0, 1], [-1, 1], [1, 0], [-1, 0], [0, -1]]

que = []
d[sx][sy] = 0
que << [sx, sy]

while que.size > 0
  cx, cy = que.shift

  dxdy.each do |dx, dy|
    nx, ny = cx + dx, cy + dy

    if nx >= 0 && nx < 500 && ny >= 0 && ny < 500 && m[nx][ny] != "#" && d[nx][ny] == -1
      d[nx][ny] = d[cx][cy] + 1
      que << [nx, ny]
    end
  end
end

puts(d[x][y])
