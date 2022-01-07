# 6.5 集合に対する全探索と動的計画法
N = gets.chomp.to_i
a = []
(N - 1).times do |i|
  aa = gets.chomp.split(" ").map(&:to_i)
  a << [0] * (i + 1) + aa
end

ALL = 1 << N
happy = Array.new(ALL, 0)

def has_bit(n, i)
  (n & (1 << i) > 0)
end

ALL.times do |n|
  N.times do |i|
    (i + 1).upto(N - 1) do |j|
      if has_bit(n, i) && has_bit(n, j)
        happy[n] += a[i][j]
      end
    end
  end
end

ans = -10 ** 100

ALL.times do |n1|
  ALL.times do |n2|
    next if n1 & n2 > 0
    n3 = ALL - 1 - (n1 | n2)
    ans = [ans, happy[n1] + happy[n2] + happy[n3]].max
  end
end

puts ans
