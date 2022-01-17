# 6.7 累積和
N = gets.chomp.to_i
S = gets.chomp

min_turn = 300000

sum_W = [0]

N.times do |i|
  if S[i] == "W"
    sum_W << sum_W[i] + 1
  else
    sum_W << sum_W[i]
  end
end

N.times do |i|
  w = sum_W[i]
  e = (N - 1 - i) - (sum_W[N] - sum_W[i + 1])
  turn = w + e

  min_turn = [min_turn, turn].min
end

puts(min_turn)
