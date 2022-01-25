# ref: open data structure 10.1 BinaryHeap
class BinaryHeap
  attr_accessor :n, :a
  def initialize
    @n = 0
    @a = Array.new
  end

  def compare(x, y)
    return x[0] - y[0]
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
    if @n + 1 > @a.size
      resize
    end

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

    if (3 * n < @a.size)
      resize
    end

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

  def resize
    new_size = [2 * @n, 1].max
    b = Array.new(new_size - @n)
    @a += b
  end
end

# Dijkstra
N, M = gets.chomp.split(" ").map(&:to_i)

g = Array.new(N) { Array.new }

M.times do
  a, b = gets.chomp.split(" ").map(&:to_i)
  a -= 1
  b -= 1
  g[a] << b
  g[b] << a
end

dist = Array.new(N, -1)
q = BinaryHeap.new
q.add([0, 0])

dist[0] = 0

while q.n > 0
  d, i = q.remove

  g[i].each do |j|
    x = 1

    if dist[j] == -1 || dist[j] > dist[i] + x
      dist[j] = dist[i] + x
      q.add([dist[j], j])
    end
  end
end

if dist[N - 1] == 2
  puts("POSSIBLE")
else
  puts("IMPOSSIBLE")
end
