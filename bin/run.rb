require_relative '../config/environment'

puts "hello world"

def greet
    puts 'Tacit. The game of allusive fun!'
    puts "Enter your name below to play:" 
    # What could we put here to allow a user to type a response?
    user_name = gets.chomp
end


# Game.find_by(name: category_name)
# User.games 
# User.words #puts list of words played