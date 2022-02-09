N = gets.chomp.to_i
S = " " + gets.chomp
c = [0] + gets.chomp.split(" ").map(&:to_i)
d = [0] + gets.chomp.split(" ").map(&:to_i)

INF = 10 ** 20

cost = Array.new(N + 1) { Array.new(N + 1, INF) }
cost[0][0] = 0

1.upto(N) do |i|
  i.times do |j|
    if S[i] == "("
      cost[i][j + 1] = [cost[i][j + 1], cost[i - 1][j]].min

      if j > 0
        cost[i][j - 1] = [cost[i][j - 1], cost[i - 1][j] + c[i]].min
      end
    else
      if j > 0
        cost[i][j - 1] = [cost[i][j - 1], cost[i - 1][j]].min
      end

      cost[i][j + 1] = [cost[i][j + 1], cost[i - 1][j] + c[i]].min
    end

    cost[i][j] = [cost[i][j], cost[i - 1][j] + d[i]].min
  end
end

puts(cost[N][0])
