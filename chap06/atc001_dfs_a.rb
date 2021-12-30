ENV[Z = "RUBY_THREAD_VM_STACK_SIZE"] || exec({ Z => "100000000" }, "ruby", $0)

class Solver
  attr_reader :visited

  def initialize(h, w, c)
    @h = h
    @w = w
    @c = c
    @visited = Array.new(h) { Array.new(w, false) }
    @dxdy = [[0, -1], [1, 0], [0, 1], [-1, 0]]
  end

  def dfs(x, y)
    @visited[x][y] = true
    # 0, -1
    if x >= 0 && x < @h && y - 1 >= 0 && y - 1 < @w && @c[x][y - 1] != "#" && !@visited[x][y - 1]
      dfs(x, y - 1)
    end
    # 1, 0
    if x + 1 >= 0 && x + 1 < @h && y >= 0 && y < @w && @c[x + 1][y] != "#" && !@visited[x + 1][y]
      dfs(x + 1, y)
    end
    # 0, 1
    if x >= 0 && x < @h && y + 1 >= 0 && y + 1 < @w && @c[x][y + 1] != "#" && !@visited[x][y + 1]
      dfs(x, y + 1)
    end
    # -1, 0
    if x - 1 >= 0 && x - 1 < @h && y >= 0 && y < @w && @c[x - 1][y] != "#" && !@visited[x - 1][y]
      dfs(x - 1, y)
    end
  end
end

if __FILE__ == $0
  h, w = gets.chomp.split(" ").map(&:to_i)
  c = []
  s = []
  g = []

  h.times do |i|
    r = gets.chomp.chars
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
  solver = Solver.new(h, w, c)
  solver.dfs(s[0], s[1])
  if solver.visited[g[0]][g[1]]
    puts "Yes"
  else
    puts "No"
  end
end
