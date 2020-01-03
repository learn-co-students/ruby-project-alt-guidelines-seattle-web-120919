require_relative '../config/environment'

class CommandLineInterface

    def greet
        system "clear\n\n"
        puts " _   _   _   ______  _        ______  ______   _________   ______ "
        puts "| | | | | | | |     | |      | |     / |  | \\ | | | | | \\ | |   "
        puts "| | | | | | | |---- | |   _  | |     | |  | | | | | | | | | |---- "
        puts "|_|_|_|_|_/ |_|____ |_|__|_| |_|____ \\_|__|_/ |_| |_| |_| |_|____ .\n\n"
        puts "\nPlease enter your name:\n\n" 
        @username = gets.chomp
        @user = User.create(name: @username)
        @user_id = @user.id
        main_menu
    end

    def main_menu
        system "clear\n\n"
        puts "_______  ______   ______ _____ _______ "
        puts "  | |   | |  | | | |      | |    | |   "
        puts "  | |   | |__| | | |      | |    | |   "
        puts "  |_|   |_|  |_| |_|____ _|_|_   |_|   \n\n"                              
        puts "~|~|_  _    _  _  _ _  _    _  |`   _ ||    _.   _    |`    _ |  "
        puts " | | |(/_  (_|(_|| | |(/_  (_)~|~  (_||||_|_\\|\\/(/_  ~|~|_|| |. "
        puts "            _|                                                   "
        puts "\nPlease select an option:\n\n" 
        puts "1 - Play a game"
        puts "2 - Update your profile"
        puts "3 - Delete your account"
        puts "4 - Exit the game\n\n"

        option = gets.chomp
        case option
        when "1"
            play_game
        when "2"
            update_profile
        when "3"
            delete_user
        when "4"
            exit!
        end
    end

    def play_game

        game = Game.create(user_id: @user_id, word_id: Word.all.sample.id)
        food = game.word.word
        puts "\nThe category is: #{game.word.category}\n"
        #puts food ### for testing sake! ###

        secret_word = food.split("")
        secret_word_array = []
        secret_word.each do |letter|
            if letter != " "
                secret_word_array << "_ "
            else 
                secret_word_array << "  "
            end
        end
        puts "\n"
        secret_word_array.each do |letter|
            print letter
        end 

        puts "\n\nYou have a total of 5 attempts to guess the word.\n\n"
        enter_word(food)
    end
    
    def enter_word(food)
        
        5.times do 
            word_entered = gets.chomp.downcase
            if word_entered != food.downcase
                puts "Please try again.\n\n"
            else
                system "clear"
                puts "\n\nYay! You guessed correctly!\n\n"

    puts "                                        .''.                  "
    puts "            .''.      .        *''*    :_\\/_:     .           "
    puts "           :_\\/_:   _\\(/_  .:.*_\\/_*   : /\\ :  .'.:.'.        "
    puts "       .''.: /\\ :    /)\\   ':'* /\\ *  : '..'.  -=:o:=-        "
    puts "      :_\\/_:'.:::.  | ' *''*    * '.\\'/.'_\\(/_ '.':'.'        "
    puts "      : /\\ : :::::  =  *_\\/_*     -= o =- /)\\     '  *        "
    puts "       '..'  ':::' === * /\\ *     .'/.\\'.  ' ._____           "
    puts "           *        |   *..*         :        |.   |' .---'|   "
    puts "             *      |     _            .--'|  ||   | _|    |   "
    puts "             *      |  .-'|        __  |   |  |    ||      |   "
    puts "          .-----.  / \\  |' |  ||  |  | |   |  |    ||      |   "
    puts "      ___'       '/'''\\ |  '-.''.    '-'   '-.'    '`      |____"
    puts "       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "                           ~-~-~-~-~-~-~-~-~-~    /|          "
    puts "               )      ~-~-~-~-~-~-~-~  /|~       /_|\\        "
    puts "             _-H-__  -~-~-~-~-~-~     /_|\\    -~======-~     "
    puts "     ~-\\XXXXXXXXXX/~     ~-~-~-~     /__|_\\ ~-~-~-~         "
    puts "     ~-~-~-~-~-~    ~-~~-~-~-~-~    ========  ~-~-~-~         "
    puts "           ~-~~-~-~-~-~-~-~-~-~-~-~-~ ~-~~-~-~-~-~            "
    puts "                             ~-~~-~-~-~-~                  \n\n"

                puts "\nEnter any key to return to the main menu.\n"
                key = gets.chomp
                case key
                when "1"
                    main_menu
                end
                main_menu
            end
        end

        system "clear"
        puts "Sorry, better luck next time! \n\n"
        puts " ¯\\(°_o)/¯ "
        puts "\n\nEnter any key to return to the main menu.\n"
        option = gets.chomp
        case option
        when "1"
            main_menu
        end       
        main_menu
        # start_time = Time.now
        # end_time = start_time + 30
        # while Time.now < end_time
        # end
        # puts "Time is Up!"
        # system(%Q{say -v "Vick" "Your tomato has exploded. Time is up."})
        # get_score
        
    end

    def update_profile
        system "clear\n\n"
        puts " ______   ______   ______   ______ _____  _        ______ "
        puts "| |  | \\ | |  | \\ / |  | \\ | |      | |  | |      | |     "
        puts "| |__|_/ | |__| | | |  | | | |----  | |  | |   _  | |---- "
        puts "|_|      |_|  \\_\\ \\_|__|_/ |_|     _|_|_ |_|__|_| |_|____ \n\n"
        puts "User ID: #{@user.id}"
        puts "Username: #{@user.name}"
        puts "\nEnter 1 to change username."
        puts "Enter 2 to return to the main menu."
        profile_option = gets.chomp
        
        case profile_option
        when "1"
            puts "\nEnter new username:\n"
            new_name = gets.chomp
            find_user = User.find_by(name: @user.name) # find user by name, set to variable
            find_user.update(name: new_name) # update to new name

            @user = User.find_by(name: new_name) # find user by new name
            puts "\nYour username has been updated. Welcome #{@user.name}!\n"
            puts "\nEnter any key to return to the main menu.\n"
            key = gets.chomp
                case key
                when "1"
                    main_menu
                end
        when "2"
            main_menu
        end
        system "clear"
        main_menu
    end

    # def get_score
    #     # User.score = word.sum(user_id)
    #     User.score = Game.find_by(user_id: user_id).count
    #     puts "#{User.name} scored #{User.score} points!"
    #     binding.pry
    # end

    def delete_user
        system "clear\n\n"
        puts "Are you sure you want to delete your account?  Y / N ?"
        option = gets.chomp
        case option
        when "N"
            main_menu
        when "Y"
            @user.destroy
        
    puts "                           .___ ___.                     "
    puts "    ____   ____   ____   __| _/ \\_ |__ ___.__. ____      "
    puts "   / ___\\ /  _ \\ /  _ \\ / __ |   | __ <   |  |/ __ \\     "
    puts "  / /_/  >  <_> |  <_> ) /_/ |   | \\_\\ \\___  \\  ___/     "
    puts "  \\___  / \\____/ \\____/\\____ |   |___  / ____|\\___  > /\\ "
    puts " /_____/                    \\/       \\/\\/         \\/  \\/ "

            puts "\nYour account has been deleted. Thanks for playing!\n\n"
            puts "\nEnter any key to exit the game.\n"
            key = gets.chomp
            case key
            when "1"
                exit! 
            end
            exit! 
        end 
        main_menu
    end
end
cli = CommandLineInterface.new
cli.greet

# binding.pry