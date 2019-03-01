class Ed

  # The constructor for the class
  def initialize(file, password)
    # No matter what, we are going to have to read in the file
    # May as well do it in the initializer
    @lines = read_in_file file
    # No matter what, we are going to have to generate the key
    # May as well do it in the initializer
    @key = generate_key password
  end

  def read_in_file(file)
    lines = []
    File.open(file, "r").each_line do |line|
      # For each line read from the file, append that line ( << ) to
      # the lines array.
      # We also chomp, which trims carriage returns
      lines << line.chomp
    end
    lines
  end

  def generate_key(password)
    password.split('').map { |c| c.ord * 2}.sum + 1
  end

  # Returns an array of strings 
  def encrypt
    encrypted_lines = []
    @lines.each do |line|
      encrypted_lines << line.split('').map { |c| ((c.ord + @key) % 128).chr }.join('')
    end
    encrypted_lines
  end

  def decrypt
    decrypted_lines = []
    @lines.each do |line|
      decrypted_lines << line.split('').map { |c| ((c.ord - @key) % 128).chr }.join('')
    end
    decrypted_lines
  end

  def print_result lines
    lines.each do |line|
      STDOUT.puts line
    end
  end
end
