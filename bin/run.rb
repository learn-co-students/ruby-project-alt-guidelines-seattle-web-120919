require_relative '../config/environment'
puts "hello world"

def greet
    puts 'Tacit. The game of allusive fun!'
    puts "Enter your name below to play:" 
    user_name = gets.chomp
    user_id = User.create(name: user_name, score:0).id #revisit score
    Game.create(user_id: user_id, word_id: Word.all.sample.id)
    display_word
end

def display_word
    binding.pry

end

def get_score
    User.score = word.user_id.count
    # User.score = Game.find_by(user_id: user_name).count
    puts "#{User.name} scored #{User.score} points!"
end

def delete_user

end

# User.games 
# User.words #puts list of words played
greet