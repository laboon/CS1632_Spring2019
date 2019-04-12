require_relative 'exiter.rb'

if ARGV.count > 0
  check ARGV[0]
else
  puts "Enter an argument"
  exit 4
end
