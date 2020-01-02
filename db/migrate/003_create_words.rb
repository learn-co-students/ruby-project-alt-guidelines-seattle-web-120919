class CreateWords < ActiveRecord::Migration[5.2]
    def change
        create_table :words do |t|
            t.belongs_to :game
            t.string :given_word
            t.string :synonyms
            t.timestamps
        end
    end
end