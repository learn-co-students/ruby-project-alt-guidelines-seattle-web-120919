require_relative '../config/environment'

class CommandLineInterface

    def main_menu
        puts "Please select an option:"
        puts "1 - Play a game"
        puts "2 - Update your profile"
        puts "3 - Delete your account"
        puts "4 - Exit the game"
        gets.chomp
    end

    def greet
        puts "Welcome!!! Play TACIT. The game of allusive fun! /n Enter your name below to play:" 
        @user_name = gets.chomp
        @user = User.create(name: @user_name, score:0) #revisit score
        @user_id = @user.id
        main_menu
        option = gets.chomp
        case option
        when "1"
            play_game #(game)
        when "2"
            update_profile
        when "3"
            delete_user
        when "4"
            exit!
        end
    end

    def play_game #(game)
        game = Game.create(user_id: @user_id, word_id: Word.all.sample.id)
        w = game.word.word
        puts "Your hint is: #{game.word.hint}"
        puts w

        secret_word = game.word.word.split("")
        secret_word_array = []
        secret_word.each do |letter|
            if letter != " "
                secret_word_array << "_ "
            else 
                secret_word_array << "  "
            end
        end

        puts " "
        secret_word_array.each do |letter|
            print letter 
        end 
        puts " "
        puts " "
        puts "You have 5 total attempts to guess the secret word."
        enter_word(w)
    end
    
    def enter_word(w)
        
        5.times do 
            word_entered = gets.chomp
            if word_entered != w
                puts "Try Again."
            else
                puts "You guessed correctly! Good Job!"
                self.main_menu
            end
        end

        # play_game(game)
        # start_time = Time.now
        # end_time = start_time + 30
        # while Time.now < end_time
        # end
        # puts "Time is Up!"
        # system(%Q{say -v "Vick" "Your tomato has exploded. Time is up."})
        # get_score
    end

    def update_profile
        puts "User id: #{@user_id}"
        puts "Username: #{@user_name}"
        puts "Enter 1 to change username "
        puts "Enter 2 to return to the Main Menu"
        new_name = gets.chomp
        
        if new_name == "1"
            user = User.find_by(name: @user_name)
            user.update(name: new_name)
            new_username = User.find_by(name: new_name)
            puts "Your username is now #{new_username}."
        else 
            main_menu
        end
        main_menu
    end

    # def get_score
    #     # User.score = word.sum(user_id)
    #     User.score = Game.find_by(user_id: user_id).count
    #     puts "#{User.name} scored #{User.score} points!"
    #     binding.pry
    # end

    def delete_user
        @user.destroy
    end

end
cli = CommandLineInterface.new
cli.greet

# binding.pry