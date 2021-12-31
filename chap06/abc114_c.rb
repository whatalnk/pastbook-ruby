N = gets.chomp.to_i

@ans = 0

def dfs(n, use3, use5, use7)
  if n > N
    return
  end
  if use3 && use5 && use7
    @ans += 1
  end
  dfs(10 * n + 3, true, use5, use7)
  dfs(10 * n + 5, use3, true, use7)
  dfs(10 * n + 7, use3, use5, true)
end

dfs(0, false, false, false)

puts @ans
