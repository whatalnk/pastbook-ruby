# 6.7 累積和
N = gets.chomp.to_i
S = gets.chomp

min_turn = 300000

N.times do |i|
  turn = 0

  N.times do |j|
    next if j == i

    turn += 1 if j < i && S[j] == "W"

    turn += 1 if j > i && S[j] == "E"
  end

  min_turn = [min_turn, turn].min
end

puts(min_turn)
