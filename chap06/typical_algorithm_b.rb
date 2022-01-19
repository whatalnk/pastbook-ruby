# 貪欲法

N = gets.chomp.to_i
ab = []

N.times do
  a, b = gets.chomp.split(" ").map(&:to_i)
  ab << [a, b]
end

ab.sort_by! { |ab| ab[1] }

ans = 0
cur = 0

ab.each do |a, b|
  if cur < a
    ans += 1
    cur = b
  end
end

puts(ans)
