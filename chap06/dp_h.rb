MOD = 10 ** 9 + 7

H, W = gets.chomp.split(" ").map(&:to_i)
a = []

H.times do
  r = gets.chomp.split("")
  a << r
end

cnt = Array.new(H) { Array.new(W, 0) }
cnt[0][0] = 1

H.times do |i|
  W.times do |j|
    next if a[i][j] == "#"

    if i > 0
      cnt[i][j] += cnt[i - 1][j]
    end

    if j > 0
      cnt[i][j] += cnt[i][j - 1]
    end

    cnt[i][j] %= MOD
  end
end

puts(cnt[H - 1][W - 1])
