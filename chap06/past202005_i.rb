N = gets.chomp.to_i
Q = gets.chomp.to_i

row_num = (0...N).to_a
col_num = (0...N).to_a
trans_flag = false

Q.times do
  q = gets.chomp.split(" ").map(&:to_i)

  if q[0] == 1
    a, b = q[1] - 1, q[2] - 1
    row_num[a], row_num[b] = row_num[b], row_num[a]
  elsif q[0] == 2
    a, b = q[1] - 1, q[2] - 1
    col_num[a], col_num[b] = col_num[b], col_num[a]
  elsif q[0] == 3
    row_num, col_num = col_num, row_num
    trans_flag = !trans_flag
  else
    a, b = q[1] - 1, q[2] - 1

    if trans_flag
      puts(col_num[b] * N + row_num[a])
    else
      puts(row_num[a] * N + col_num[b])
    end
  end
end
