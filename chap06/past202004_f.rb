# 貪欲法
N = gets.chomp.to_i
tasks = Array.new(N) { Array.new }

N.times do
  a, b = gets.chomp.split(" ").map(&:to_i)
  tasks[a - 1] << b
end

cnt = Array.new(101, 0)

ans = 0

N.times do |d|
  tasks[d].each do |b|
    cnt[b] += 1
  end

  100.downto(1) do |b|
    if cnt[b] > 0
      ans += b
      cnt[b] -= 1
      break
    end
  end

  puts(ans)
end
