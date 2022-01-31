N, M = gets.chomp.split(" ").map(&:to_i)

ok = Array.new(N + 1, true)

M.times do
  a = gets.chomp.to_i
  ok[a] = false
end

MOD = 10 ** 9 + 7

cnt = Array.new(N + 1, 0)
cnt[0] = 1

1.upto(N) do |i|
  if ok[i]
    if i == 1
      cnt[i] = cnt[i - 1]
    else
      cnt[i] = (cnt[i - 1] + cnt[i - 2]) % MOD
    end
  end
end

puts(cnt[N])
