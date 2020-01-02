User.create(name: Faker::Name.name)
Game.create(name: Faker::Game.name)
Word.create(game_id: Game.all.sample.id, given_word: Faker::Hacker.say_something_smart)