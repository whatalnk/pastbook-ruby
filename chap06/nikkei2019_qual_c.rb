# 貪欲法

N = gets.chomp.to_i

ab = []

N.times do
  a, b = gets.chomp.split(" ").map(&:to_i)
  ab << [a, b]
end

ab.sort_by! { |x| -x[0] - x[1] }

ans = 0

N.times do |i|
  a, b = ab[i]

  if i % 2 == 0
    ans += a
  else
    ans -= b
  end
end

puts(ans)
