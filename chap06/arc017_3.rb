# 半分全列挙

N, X = gets.chomp.split(" ").map(&:to_i)
a = []
b = []

N.times do |i|
  w = gets.chomp.to_i

  if i.even?
    a << w
  else
    b << w
  end
end

def has_bit(n, i)
  return n & (1 << i) > 0
end

h = Hash.new(0)

(1 << b.size).times do |n|
  s = 0

  N.times do |i|
    if has_bit(n, i)
      s += b[i]
    end
  end

  h[s] += 1
end

ans = 0

(1 << a.size).times do |n|
  s = 0

  N.times do |i|
    if has_bit(n, i)
      s += a[i]
    end
  end

  ans += h[X - s]
end

puts(ans)
