# ref: open data structure 10.2 MeldableHeap
tuple = Struct.new(:d, :i)

Node = Struct.new(:x, :left, :right, :parent)

class MeldableHeap
  attr_accessor :r, :n
  def initialize
    @r = nil
    @n = 0
  end

  def compare(x, y)
    x.d - y.d
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

# Dijkstra
N, M = gets.chomp.split(" ").map(&:to_i)

g = Array.new(N) { Array.new }

M_MAX = 10 ** 6

M.times do
  a, b = gets.chomp.split(" ").map(&:to_i)
  a -= 1
  b -= 1
  g[a] << b
  g[b] << a
end

dist = Array.new(N, -1)
q = MeldableHeap.new
q.add(tuple.new(0, 0))

dist[0] = 0

while q.n > 0
  di = q.remove

  g[di.i].each do |j|
    if dist[j] == -1 || dist[j] > dist[di.i] + 1
      dist[j] = dist[di.i] + 1
      q.add(tuple.new(dist[j], j))
    end
  end
end

if dist[N - 1] == 2
  puts("POSSIBLE")
else
  puts("IMPOSSIBLE")
end
