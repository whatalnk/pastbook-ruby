bingo = []

3.times do
  bingo << gets.chomp.split(" ").map(&:to_i)
end

bingo_ = Array.new(3) { Array.new(3, false) }

n = gets.chomp.to_i

n.times do
  x = gets.chomp.to_i

  3.times do |i|
    3.times do |j|
      if x == bingo[i][j]
        bingo_[i][j] = true
      end
    end
  end
end

if (bingo_[0][0] && bingo_[0][1] && bingo_[0][2]) || (bingo_[1][0] && bingo_[1][1] && bingo_[1][2]) || (bingo_[2][0] && bingo_[2][1] && bingo_[2][2]) || (bingo_[0][0] && bingo_[1][1] && bingo_[2][2]) || (bingo_[0][2] && bingo_[1][1] && bingo_[2][0]) || (bingo_[0][0] && bingo_[1][0] && bingo_[2][0]) || (bingo_[0][1] && bingo_[1][1] && bingo_[2][1]) || (bingo_[0][2] && bingo_[1][2] && bingo_[2][2])
  puts("Yes")
else
  puts("No")
end
