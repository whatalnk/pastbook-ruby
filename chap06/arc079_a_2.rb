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
    if n + 1 > @a.size
      resize
    end

    @n += 1
    @a[@n] = x
    bubble_up(@n - 1)
    return true
  end

  def bubble_up
  end

  def remove
  end

  def trickle_down
  end

  def resize
    new_size = [2 * @n, 1].max
    b = Array.new(new_size - @n)
    @a += b
  end
end
