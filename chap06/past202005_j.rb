N, M = gets.chomp.split(" ").map(&:to_i)
a = gets.chomp.split(" ").map(&:to_i)
b = Array.new(N, 0)

a.each do |x|
  k = b.bsearch_index { |i| i > -x }

  if k == N || k.nil?
    puts(-1)
  else
    puts(k + 1)
    b[k] = -x
  end
end
