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

N, M = gets.chomp.split(" ").map(&:to_i)
xyc_large = []

N.times do
  xyc = gets.chomp.split(" ").map(&:to_i)
  xyc_large << xyc
end

xyc_small = []

M.times do
  xyc = gets.chomp.split(" ").map(&:to_i)
  xyc_small << xyc
end

def has_bit(n, i)
  n & (1 << i) > 0
end

def calc_edge_cost(xyc1, xyc2)
  x1, y1, c1 = xyc1
  x2, y2, c2 = xyc2
  cost = Math.hypot(x1 - x2, y1 - y2)

  if c1 != c2
    cost *= 10
  end

  cost
end

ans = 10.0 ** 100

(1 << M).times do |b|
  xyc_use = []

  xyc_large.each do |xyc|
    xyc_use << xyc
  end

  M.times do |i|
    if has_bit(b, i)
      xyc_use << xyc_small[i]
    end
  end

  sz = xyc_use.size
  que = MeldableHeap.new
  que.add([0.0, 0])
  used = Array.new(sz, false)
  res = 0.0
  while que.n > 0
    cost, i = que.remove
    unless used[i]
      res += cost
      used[i] = true

      sz.times do |j|
        unless used[j]
          cost = calc_edge_cost(xyc_use[i], xyc_use[j])
          que.add([cost, j])
        end
      end
    end
  end

  ans = [ans, res].min
end

puts(ans)
