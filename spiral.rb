rows, columns = !ARGV.empty? ? ARGV.map(&:to_i) : [7,7]

row_start = 0
row_end = rows - 1

column_start = 0
column_end = columns - 1

t = []
rows.times { |i| t[i] = [] }

ind = 0
max_ind = rows*columns-1

def draw t
  t.each do |row|
    row.map! do |n|
      case n.to_s.size
      when 0
        '  '
      when 1
        " #{n}"
      when 2
        n
      end
    end
    p row.join(' ')
  end
  p '-'*25
end

while ind < max_ind do
  
  sleep 0.5

  unless (column_end - column_start).zero?
    column_start.upto column_end-1 do |i|
      t[row_start][i] = ind
      ind += 1
    end
    draw t
  end

  unless (row_end - row_start).zero?
    row_start.upto row_end-1 do |i|
      t[i][column_end] = ind
      ind += 1
    end
    draw t
  end

  unless (column_end - column_start).zero?
    column_end.downto column_start+1 do |i|
      t[row_end][i] = ind
      ind += 1
    end
    draw t
  end

  unless (row_end - row_start).zero?
    row_end.downto row_start+1 do |i|
      t[i][column_start] = ind
      ind += 1
    end
    draw t
  end

  row_start += 1
  row_end -= 1

  column_start += 1
  column_end -= 1

end

draw t