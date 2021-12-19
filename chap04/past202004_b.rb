s = gets.chomp.split("")
h = Hash.new(0)

s.each do |x|
  h[x] += 1
end

if h["a"] > h["b"] && h["a"] > h["c"]
  puts("a")
elsif h["b"] > h["a"] && h["b"] > h["c"]
  puts("b")
else
  puts("c")
end
