require_relative ('controller')
require_relative ('view')

this_game = FlashcardsGame.new('flashcards.csv')
this_game.begin_game
