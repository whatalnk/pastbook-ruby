# 6.4.5 グラフに対する動的計画法
ENV[Z = "RUBY_THREAD_VM_STACK_SIZE"] || exec({ Z => "100000000" }, "ruby", $0)

N, M = gets.chomp.split(" ").map(&:to_i)
@edges = Array.new(N) { Array.new() }
@indeg = Array.new(N, 0)

M.times do
  x, y = gets.chomp.split(" ").map(&:to_i)
  @edges[x - 1] << y - 1
  @indeg[y - 1] += 1
end

@len = Array.new(N, 0)
@done = Array.new(N, false)

def rec(i)
  if @done[i]
    return @len[i]
  end
  @len[i] = 0
  @edges[i].each do |j|
    @len[i] = [@len[i], rec(j) + 1].max
  end
  @done[i] = true
  return @len[i]
end

N.times do |i|
  if @indeg[i] == 0
    rec(i)
  end
end

puts @len.max
