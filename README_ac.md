_______  ______   ______ _____ _______ 
  | |   | |  | | | |      | |    | |   
  | |   | |__| | | |      | |    | |   
  |_|   |_|  |_| |_|____ _|_|_   |_|  
                                        
~|~|_  _    _  _  _ _  _    _  |'   _ ||    _.   _    |`    _  |  
 | | |(/_  (_|(_|| | |(/_  (_)~|~  (_||||_|_\|\/(/_  ~|~|_|| | . 
            _| 

============================================================================

Rules:

1. A player enters their chosen username to begin. 
2. Each game will provide a category for the word or phrase to be guessed.
3. A player has up to 5 chances to guess correctly or the game ends.

============================================================================

Models:
`Game`, `User`, `Words`: A user has many games and many words through games; a game belongs to user and word; a word has many games and many users through games.

User Stories:
◦ As a user, I want to be able to enter a username (Create)
◦ As a user, I want to be able to play many games (Read)
◦ As a user, I want to be able to update my username (Update)
◦ As a user, I want to be able to delete my account (Delete)