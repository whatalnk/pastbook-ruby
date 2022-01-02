N, L = gets.chomp.split(" ").map(&:to_i)
x = gets.chomp.split(" ").map(&:to_i)
t1, t2, t3 = gets.chomp.split(" ").map(&:to_i)

h = Array.new(L + 1, false)
x.each do |i|
  h[i] = true
end

cost = Array.new(L + 1, 10 ** 100)

cost[0] = 0
(1..L).each do |i|
  cost[i] = [cost[i], cost[i - 1] + t1].min

  if i >= 2
    cost[i] = [cost[i], cost[i - 2] + t1 + t2].min
  end

  if i >= 4
    cost[i] = [cost[i], cost[i - 4] + t1 + 3 * t2].min
  end
  if h[i]
    cost[i] += t3
  end
end

ans = cost[L]
[L - 3, L - 2, L - 1].each do |i|
  if i >= 0
    ans = [ans, cost[i] + t1 / 2 + t2 * (2 * (L - i) - 1) / 2].min
  end
end

puts ans
