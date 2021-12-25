n, q = gets.chomp.split(" ").map(&:to_i)
g = Array.new(n) { Array.new(n, false) }

q.times do
  s = gets.chomp.split(" ").map(&:to_i)

  if s[0] == 1
    a = s[1] - 1
    b = s[2] - 1
    g[a][b] = true

  elsif s[0] == 2
    a = s[1] - 1

    n.times do |i|
      if i == a
        next
      else

        if g[i][a]
          g[a][i] = true
        end
      end
    end
  else

    a = s[1] - 1
    users = []

    n.times do |i|
      if g[a][i]
        n.times do |j|
          if g[i][j]
            users << j
          end
        end
      end
    end

    users.each do |i|
      if i == a
        next
      end

      g[a][i] = true
    end
  end
end

n.times do |i|
  puts(g[i].map { |x| x ? "Y" : "N" }.join(""))
end
