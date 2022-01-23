# 二分探索

R, B = gets.chomp.split(" ").map(&:to_i)
X, Y = gets.chomp.split(" ").map(&:to_i)

X_MAX = 10 ** 18 + 1

def check(i)
  r = R - i
  b = B - i

  if r < 0 || b < 0
    return true
  end

  num = r / (X - 1) + b / (Y - 1)
  return num < i
end

ans = (0..X_MAX).bsearch { |i| check(i) }

puts(ans - 1)
