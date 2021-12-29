h, w = gets.chomp.split(" ").map(&:to_i)
c = []
s = []
g = []

h.times do |i|
  r = gets.chomp.split(" ").map(&:to_i)
  w.times do |j|
    if r[j] == "s"
      s = [i, j]
    end
    if r[j] == "g"
      g = [i, j]
    end
  end
  c << r
end
visited = Array.new(h) { Array.new(w, false) }
dxdy = [[0, -1], [1, 0], [0, 1], [-1, 0]]

def dfs(x, y)
end
