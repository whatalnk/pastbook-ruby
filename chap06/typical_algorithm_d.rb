# ref: open data structure 10.2 MeldableHeap
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
Tuple = Struct.new(:d, :i)

N, M = gets.chomp.split(" ").map(&:to_i)

g = Array.new(N) { Array.new }

M.times do
  u, v, c = gets.chomp.split(" ").map(&:to_i)
  g[u] << [v, c]
end

dist = Array.new(N, -1)
q = MeldableHeap.new
q.add(Tuple.new(0, 0))

dist[0] = 0

done = Array.new(N, false)

while q.n > 0
  di = q.remove

  next if done[di.i]

  done[di.i] = true

  g[di.i].each do |j, c|
    if dist[j] == -1 || dist[j] > dist[di.i] + c
      dist[j] = dist[di.i] + c
      q.add(Tuple.new(dist[j], j))
    end
  end
end

puts(dist[N - 1])
