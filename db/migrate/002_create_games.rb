class CreateGames < ActiveRecord::Migration[5.2]
    def change
        create_table :games do |t|
            t.belongs_to :user
            t.integer :num_of_games
            t.string :category_names
            t.string :name
            t.timestamps
        end
    end
end