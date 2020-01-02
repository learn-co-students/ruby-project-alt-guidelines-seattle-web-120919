class CreateWords < ActiveRecord::Migration[5.2]
    def change
        create_table :words do |t|
            t.belongs_to :game
            t.belongs_to :category
            t.string :given_word
            t.timestamps
        end
    end
end