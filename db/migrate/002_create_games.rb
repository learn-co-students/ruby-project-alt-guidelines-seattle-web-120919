class CreateGames < ActiveRecord::Migration[5.2]
    def change
        create_table :games do |t|
            t.belongs_to :user
            t.belongs_to :word
            t.timestamps
        end
    end
end