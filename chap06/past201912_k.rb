ENV[Z = "RUBY_THREAD_VM_STACK_SIZE"] || exec({Z => "100000000"}, "ruby", $0)

N = gets.chomp.to_i
r = -1
@edges = Array.new(N) { Array.new }

N.times do |i|
  x = gets.chomp.to_i

  if x == -1
    r = i
  else
    @edges[x - 1] << i
  end
end

@queries = Array.new(N) { Array.new }

Q = gets.chomp.to_i

Q.times do |q|
  a, b = gets.chomp.split(" ").map(&:to_i)
  @queries[a - 1] << [q, b - 1]
end

@ans = Array.new(Q, false)
@boss = Array.new(N, false)

def dfs(i)
  @queries[i].each do |q, b|
    @ans[q] = @boss[b]
  end

  @boss[i] = true

  @edges[i].each do |j|
    dfs(j)
  end

  @boss[i] = false
end

dfs(r)

Q.times do |q|
  if @ans[q]
    puts("Yes")
  else
    puts("No")
  end
end
