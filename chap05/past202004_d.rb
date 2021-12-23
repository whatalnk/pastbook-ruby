require "set"

s = gets.chomp.split("")

h = Set.new([])
h << "."

s.each do |c|
  h << c
end

if s.size >= 2
  h << ".."

  s.each_cons(2) do |c|
    h << c.join("")
    h << c[0] + "."
    h << "." + c[1]
  end
end

if s.size >= 3
  h << "..."

  s.each_cons(3) do |c|
    h << c.join("")
    h << c[0] + c[1] + "."
    h << c[0] + "." + c[2]
    h << "." + c[1] + c[2]
    h << c[0] + ".."
    h << "." + c[1] + "."
    h << ".." + c[2]
  end
end

puts(h.size)
