n = gets.chomp.to_i
c = gets.chomp.split(" ").map(&:to_i)
q = gets.chomp.to_i

ans = 0

q.times do
  s = gets.chomp.split(" ").map(&:to_i)

  if s[0] == 1
    x, a = s[1] - 1, s[2]

    if c[x] >= a
      ans += a
      c[x] -= a
    end
  elsif s[0] == 2
    a = s[1]

    if (0...n).step(2).map { |i| c[i] }.min >= a
      (0...n).step(2) do |i|
        ans += a
        c[i] -= a
      end
    end
  else

    a = s[1]

    if c.min >= a
      n.times do |i|
        ans += a
        c[i] -= a
      end
    end
  end
end

puts(ans)
