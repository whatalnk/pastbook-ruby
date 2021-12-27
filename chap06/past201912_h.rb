n = gets.chomp.to_i
c = gets.chomp.split(" ").map(&:to_i)
q = gets.chomp.to_i

min_odd = (1..n).filter_map { |i| c[i - 1] if i.odd? }.min
n_odd = n / 2
n_odd += 1 if n.odd?

min_all = c.min

ans = 0
to_sum_odd = 0
to_sum_all = 0

q.times do
  s = gets.chomp.split(" ").map(&:to_i)

  if s[0] == 1
    x, a = s[1] - 1, s[2]

    if (x + 1).odd?
      if c[x] - to_sum_odd - to_sum_all >= a
        ans += a
        c[x] -= a
        min_odd = [min_odd, c[x]].min
        min_all = [min_odd, min_all].min
      end
    else
      if c[x] - to_sum_all >= a
        ans += a
        c[x] -= a
        min_all = [min_all, c[x]].min
      end
    end
  elsif s[0] == 2
    a = s[1]

    if min_odd >= a
      to_sum_odd += a
      min_odd -= a
      min_all = [min_odd, min_all].min
    end
  else
    a = s[1]

    if min_all >= a
      to_sum_all += a
      min_odd -= a
      min_all -= a
    end
  end
end

puts(ans + to_sum_odd * n_odd + to_sum_all * n)
