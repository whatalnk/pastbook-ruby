Node = Struct.new(:x, :left, :right, :parent)

class MeldableHeap
  attr_accessor :r, :n
  def initialize
    @r = nil
    @n = 0
  end

  def compare(x, y)
    x.c - y.c
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

N, M = gets.chomp.split(" ").map(&:to_i)
g = Array.new(N) { Array.new }

M.times do
  u, v, c = gets.chomp.split(" ").map(&:to_i)
  g[u] << [v, c]
  g[v] << [u, c]
end

marked = Array.new(N, false)

marked_count = 0

marked[0] = 0
marked_count += 1

q = MeldableHeap.new
Tuple = Struct.new(:c, :j)

g[0].each do |j, c|
  q.add(Tuple.new(c, j))
end

sum = 0

while marked_count < N
  cj = q.remove
  next if marked[cj.j]
  marked[cj.j] = true
  marked_count += 1

  sum += cj.c

  g[cj.j].each do |j, c|
    next if marked[j]
    q.add(Tuple.new(c, j))
  end
end

puts(sum)
