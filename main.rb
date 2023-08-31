# Welcome Message
puts "Welcome to the Coder Bank, Please enter your name"
name = gets.chomp

# Initialize Variables
user_input = ""
$balance = 0

while user_input != 'E'

  puts "Hello #{name}, please choose from the options below:
  D - Deposit
  W - Withdraw
  B - Show Balance
  E - Exit
  "
  
  user_input = gets.chomp.capitalize
  
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
    puts "Thank you for using this bank app"
  else
    puts "Invalid entry, try again"
  end
end