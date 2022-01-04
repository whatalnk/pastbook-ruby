# 6.4.3 多次元配列を用いた動的計画法
N = gets.chomp.to_i
s = [0] + gets.chomp.split(" ").map(&:to_i)

S = s.inject(:+)

exist = Array.new(N + 1) { Array.new(S + 1, false) }

exist[0][0] = true

1.upto(N) do |i|
  0.upto(S) do |j|
    if exist[i - 1][j]
      exist[i][j] = true
    end
    if j >= s[i] && exist[i - 1][j - s[i]]
      exist[i][j] = true
    end
  end
end

ans = 0
0.upto(S) do |i|
  if exist[N][i]
    ans += 1
  end
end

puts ans
