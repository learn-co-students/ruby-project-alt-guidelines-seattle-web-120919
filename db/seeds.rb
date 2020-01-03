require "faker"
User.create(name: Faker::Name.name, score:0)

hint_array = ["dish", "fruits", "ingredient", "spice", "sushi", "vegetables"]

20.times do
    index = rand(0..5)
    word = hint_array[index]
    Word.create(word: Faker::Food.send(word), hint: hint_array[index]).word
end

Game.create(user_id: User.all.sample.id, word_id: Word.all.sample.id)


puts"seeds done"

# categories = 
# Faker::Food.dish #=> "Caesar Salad"
# Faker::Food.fruits #=> "Peaches"
# Faker::Food.ingredient #=> "Adzuki Beans"
# Faker::Food.spice #=> "Caraway Seed"
# Faker::Food.sushi #=> "Sea bream"
# Faker::Food.vegetables #=> "Broccolini"
