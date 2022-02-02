Q = gets.chomp.to_i
que = []

Q.times do
  v = gets.chomp.split(" ")

  if v[0] == "1"
    c = v[1]
    x = v[2].to_i
    que << [c, x]
  else
    d = v[1].to_i
    cnt = Hash.new(0)
    while d > 0 and que.size > 0
      c, x = que[0]

      if d >= x
        d -= x
        cnt[c] += x
        que.shift
      else
        cnt[c] += d
        que[0][1] -= d
        d = 0
      end
    end

    ans = 0

    ("a".."z").each do |c|
      ans += cnt[c] ** 2
    end

    puts(ans)
  end
end
