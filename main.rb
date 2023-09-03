require 'yaml'

# Load user database
users = YAML.load_file("userDatabase.yml")

# Welcome Message
puts "Welcome to the Coder Bank, Please enter your name"
name = gets.chomp.downcase

# Checks user Database against inputted name
if users.include?(name)
  puts "Welcome back #{name.capitalize}"
  $balance = users[name]
else
  $balance = 0
end

# Initialize Variables
user_input = ""

# Continually accept user input until exit is used
while user_input != 'E'

  puts "Hello #{name.capitalize}, please choose from the options below:
  D - Deposit
  W - Withdraw
  B - Show Balance
  E - Exit
  "
  
  user_input = gets.chomp.capitalize

# User option set
  if user_input == 'D'
    puts "How much you would you like to deposit?"
    amount = gets.chomp.to_i
    while amount < 0
      puts "That is an invalid amount, please enter an amount >= 0"
      amount = gets.chomp.to_i
    end
    $balance = $balance + amount
    puts "Thanks, you have successfully deposited $#{amount}"
  elsif user_input == 'W'
    puts "How much would you like to withdraw?"
    amount = gets.chomp.to_i
    while amount < 0
      puts "That is an invalid amount, please enter an amount >= 0"
      amount = gets.chomp.to_i
    end
    $balance = $balance - amount
    puts "Thanks, you have successfully withdrawn $#{amount}, please take your cash"
  elsif user_input == "B"
    puts "Your balance is $#{$balance}"
  elsif user_input == "E"
# When program exiting, store current balance
    users[name] = $balance
# Prepare new hash to output to YAML
    output = YAML.dump users
# Overwrite YAML file with new hash
    File.write("userDatabase.yml", output)
    puts "Thank you for using this bank app"
  else
    puts "Invalid entry, try again"
  end
end