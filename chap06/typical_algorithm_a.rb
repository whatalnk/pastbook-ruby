# 二分探索

N, K = gets.chomp.split(" ").map(&:to_i)
a = gets.chomp.split(" ").map(&:to_i)
ans = a.bsearch_index { |x| x >= K }

if ans.nil?
  puts(-1)
else
  puts(ans)
end
