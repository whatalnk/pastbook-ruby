class BinaryHeap
  attr_accessor :n, :a
  def initialize
    @n = 0
    @a = Array.new
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
    while i > 0 && @a[i] < @a[p_]
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

      if r < @n && @a[r] < @a[i]
        l = left(i)

        if @a[l] < @a[r]
          j = l
        else
          j = r
        end
      else
        l = left(i)

        if l < n && @a[l] < @a[i]
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
