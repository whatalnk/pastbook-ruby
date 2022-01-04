ENV[Z = "RUBY_THREAD_VM_STACK_SIZE"] || exec({ Z => "100000000" }, "ruby", $0)

N = gets.chomp.to_i
@h = gets.chomp.split(" ").map(&:to_i)
@cost = Array.new(N, 0)
@visited = Array.new(N, false)

def rec(i)
  if @visited[i]
    return @cost[i]
  end
  if i == 0
    @cost[i] = 0
  elsif i == 1
    @cost[i] = rec(0) + (@h[0] - @h[1]).abs
  else
    @cost[i] = [rec(i - 1) + (@h[i - 1] - @h[i]).abs, rec(i - 2) + (@h[i - 2] - @h[i]).abs].min
  end
  @visited[i] = true
  @cost[i]
end

puts rec(N - 1)
