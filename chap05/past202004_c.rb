n = gets.chomp.to_i
m = []

n.times do
  m << gets.chomp.split("")
end

(n - 2).downto(0) do |i|
  1.upto(2 * n - 3) do |j|
    if m[i][j] == "#" && (m[i + 1][j - 1] == "X" || m[i + 1][j] == "X" || m[i + 1][j + 1] == "X")
      m[i][j] = "X"
    end
  end
end

n.times do |i|
  puts(m[i].join(""))
end
