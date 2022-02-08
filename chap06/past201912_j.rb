Node = Struct.new(:x, :left, :right, :parent)

class MeldableHeap
  attr_accessor :r, :n
  def initialize
    @r = nil
    @n = 0
  end

  def compare(x, y)
    x[0] - y[0]
  end

  def merge(h1, h2)
    return h2 if h1.nil?
    return h1 if h2.nil?
    return merge(h2, h1) if compare(h1.x, h2.x) > 0

    if Random.rand(100).even?
      h1.left = merge(h1.left, h2)
      h1.left.parent = h1 if !h1.left.nil?
    else
      h1.right = merge(h1.right, h2)
      h1.right.parent = h1 unless h1.right.nil?
    end

    return h1
  end

  def add(x)
    u = Node.new(x, nil, nil, nil)
    @r = merge(u, @r)
    @r.parent = nil
    @n += 1
    return true
  end

  def remove
    x = @r.x
    @r = merge(r.left, r.right)
    @r.parent = nil unless @r.nil?
    @n -= 1
    return x
  end
end

H, W = gets.chomp.split(" ").map(&:to_i)
@a = []

H.times do
  @a << gets.chomp.split(" ").map(&:to_i)
end

def grid_dijkstra(si, sj)
  dist = Array.new(H) { Array.new(W, 10 ** 100) }
  que = MeldableHeap.new
  dist[si][sj] = 0
  que.add([0, si, sj])
  while que.n > 0
    d, i, j = que.remove
    next if d > dist[i][j]

    [[i + 1, j], [i - 1, j], [i, j + 1], [i, j - 1]].each do |i2, j2|
      if i2 >= 0 && i2 < H && j2 >= 0 && j2 < W && d + @a[i2][j2] < dist[i2][j2]
        dist[i2][j2] = d + @a[i2][j2]
        que.add([dist[i2][j2], i2, j2])
      end
    end
  end

  dist
end

dist1 = grid_dijkstra(H - 1, 0)
dist2 = grid_dijkstra(H - 1, W - 1)
dist3 = grid_dijkstra(0, W - 1)

ans = 10 ** 100

H.times do |i|
  W.times do |j|
    res = dist1[i][j] + dist2[i][j] + dist3[i][j] - 2 * @a[i][j]
    ans = [ans, res].min
  end
end

puts(ans)
