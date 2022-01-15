# 6.6 数学的問題
N = gets.chomp.to_i
ans = 0

1.upto(N - 1) do |a|
  1.upto(N - 1) do |b|
    break if N <= a * b
    ans += 1
  end
end

puts(ans)
