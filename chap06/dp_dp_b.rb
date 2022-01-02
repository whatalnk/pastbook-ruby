N, K = gets.chomp.split(" ").map(&:to_i)
h = gets.chomp.split(" ").map(&:to_i)
cost = Array.new(N, 0)
cost[0] = 0
cost[1] = cost[1] + (h[0] - h[1]).abs

(2...N).each do |i|
  cost[i] = [i - K, 0].max.upto(i - 1).map { |j| cost[j] + (h[j] - h[i]).abs }.min
end

puts cost[N - 1]
