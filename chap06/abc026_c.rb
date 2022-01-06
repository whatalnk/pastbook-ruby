# 6.4.5 グラフに対する動的計画法
ENV[Z = "RUBY_THREAD_VM_STACK_SIZE"] || exec({ Z => "100000000" }, "ruby", $0)

N = gets.chomp.to_i
@child = Array.new(N) { Array.new() }
1.upto(N - 1) do |i|
  b = gets.chomp.to_i
  @child[b - 1] << i
end

def dfs(i)
  if @child[i].empty?
    return 1
  else
    values = []
    @child[i].each do |c|
      values << dfs(c)
    end
    return values.max + values.min + 1
  end
end

puts dfs(0)
