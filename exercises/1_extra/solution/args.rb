# Figures out args stuff
def show_usage_and_exit
  puts 'Usage:'
  puts 'ruby pcp.rb *password* *e/d* *file*'
  puts '*password* is the encryption/decryption password'
  puts '*e/d* is whether to encrypt or decrypt'
  puts '*file* is the filename to use*'
  exit 1
end

def check_e_or_d str
  str == 'e' || str == 'd'
end

def check_args(args)
  return false if args.count != 3
  return false unless check_e_or_d args[1]
  args
rescue StandardError => e
  false
end
