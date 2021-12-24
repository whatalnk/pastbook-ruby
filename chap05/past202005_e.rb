n, m, q = gets.chomp.split(" ").map(&:to_i)
g = Array.new(n) { Array.new(n, 0) }

m.times do
  u, v = gets.chomp.split(" ").map(&:to_i)
  u -= 1
  v -= 1
  g[u][v] = 1
  g[v][u] = 1
end

c = gets.chomp.split(" ").map(&:to_i)

q.times do
  s = gets.chomp.split(" ").map(&:to_i)

  if s[0] == 1
    x = s[1] - 1
    puts(c[x])

    n.times do |i|
      if g[x][i] == 1
        c[i] = c[x]
      end
    end
  else

    x = s[1] - 1
    y = s[2]
    puts(c[x])
    c[x] = y
  end
end
