require 'flamegraph'

def no_problem_here(val)
  val * 2
end

def no_other_problem_here(val)
  val ** 2
end

def calc(val)
  b = no_problem_here val
  c = no_other_problem_here val
  20002 + b + c
end

# val = 1 -> 0^0, 1^1
# val = 2 -> 0^0, 1^1, 2^2
# val = 3 -> 0^0, 1^1, 2^2, 3^3

@cached_vals = {}

def cached_pow(x)
  if @cached_vals[x].nil?
    @cached_vals[x] = x ** x
  end
  @cached_vals[x]
end

def do_boring_stuff(val)
  (0..val).to_a.map { |x| cached_pow(x) }.reduce(:+)
end

raise 'Enter one positive integer argument' unless ARGV.count == 1
c = ARGV[0].to_i

Flamegraph.generate('flamegrapher.html') do
  @b = 0

  c.times do |x|
    @b = do_boring_stuff(x)
  end

  puts @b

  c.times do |n|
    s = calc n
    puts s
  end
end

# Program stack
# M - Main
# Methods a, b, c... etc.
#     C
#   BBBB  B
#  AAAAA AA
# MMMMMMMMMM
# 0123456789
