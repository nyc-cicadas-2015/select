require_relative ('view')
require_relative ('model')


module FlashcardsGame

  def self.begin_game
    viewer.display_greeting
    play_game if viewer.gets_user_input == "\n"
  end

  def self.play_game
    # until game.finished?

  end

  end
