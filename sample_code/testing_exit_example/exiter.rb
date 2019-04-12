def check(x)
  x = x.to_i
  if x < 0
    exit 1
  elsif x == 0
    puts "Zero"
  else
    exit 3
  end
end
