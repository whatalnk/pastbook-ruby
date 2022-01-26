# ref: open data structure 10.1 BinaryHeap
class BinaryHeap
  attr_accessor :n, :a
  def initialize
    @n = 0
    @a = Array.new
  end

  def compare(x, y)
    return x - y
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

# ref: open data structure 10.2 MeldableHeap
Node = Struct.new(:x, :left, :right, :parent)

class MeldableHeap
  attr_accessor :r, :n
  def initialize
    @r = nil
    @n = 0
  end

  def compare(x, y)
    x - y
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
