class CommandLineInterface < ActiveRecord::Base
    def greet
        puts 'Tacit.  The game of allusive fun!'
        puts "Select a category name to get started:"
    end

    def run
        greet 
        # What could we put here to allow a user to type a response?
        # category_name = category entered
        # Game.find_by(name: category_name)
    end
end

