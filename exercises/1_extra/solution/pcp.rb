require_relative 'args'
require_relative 'ed'

# EXECUTION STARTS HERE

valid_args = check_args ARGV

if valid_args
  password, todo, file = ARGV
  ed = Ed.new file, password
  if todo == 'e'
    res = ed.encrypt
    ed.print_result res
  elsif todo == 'd'
    res = ed.decrypt 
    ed.print_result res
  else
    show_usage_and_exit
  end
else
  show_usage_and_exit
end
