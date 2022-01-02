N = gets.chomp.to_i
h = gets.chomp.split(" ").map(&:to_i)
cost = Array.new(N, 0)
cost[0] = 0
cost[1] = cost[1] + (h[0] - h[1]).abs

(2...N).each do |i|
  cost[i] = [cost[i - 1] + (h[i - 1] - h[i]).abs, cost[i - 2] + (h[i - 2] - h[i]).abs].min
end

puts cost[N - 1]
