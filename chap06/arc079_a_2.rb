# ref: open data structure 10.1 BinaryHeap
tuple = Struct.new(:d, :i)

class BinaryHeap
  attr_accessor :n, :a
  def initialize(a_size)
    @n = 0
    @a = Array.new(a_size)
  end

  def compare(x, y)
    return x.d - y.d
  end

  def left(i)
    return 2 * i + 1
  end

  def right(i)
    return 2 * i + 2
  end

  def parent(i)
    return (i - 1) / 2
  end

  def add(x)

    @a[@n] = x
    @n += 1

    bubble_up(@n - 1)
    return true
  end

  def bubble_up(i)
    p_ = parent(i)
    while i > 0 && compare(@a[i], @a[p_]) < 0
      @a[i], @a[p_] = @a[p_], @a[i]
      i = p_
      p_ = parent(i)
    end
  end

  def remove
    x = @a[0]
    @a[0] = @a[@n - 1]
    @n -= 1
    trickle_down(0)

    return x
  end

  def trickle_down(i)
    while true
      j = -1
      r = right(i)

      if r < @n && compare(@a[r], @a[i]) < 0
        l = left(i)

        if compare(@a[l], @a[r]) < 0
          j = l
        else
          j = r
        end
      else
        l = left(i)

        if l < n && compare(@a[l], @a[i]) < 0
          j = l
        end
      end

      if j >= 0
        @a[i], @a[j] = @a[j], @a[i]
      end

      i = j
      break if i < 0
    end
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
q = BinaryHeap.new(a_size = M_MAX)
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
