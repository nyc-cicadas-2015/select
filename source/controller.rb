require_relative ('view')
require_relative ('model')


class FlashcardsGame
  attr_reader :game, :view

  def initialize(file)
    @view = Viewer.new
    @game = Game.new(file)
  end

  def begin_game
    view.display_greeting
    view.make_it_nice
    game.start
    play_game
  end

  def play_game
    until game.is_finished?
      view.display_flashcard(game.get_card)
      guess = view.gets_user_input
      result = game.correct_guess(guess)
        until result == true
          guess = view.incorrect_result
          result = game.correct_guess(guess)
        end
        view.correct_result
        view.make_it_nice
    end
    view.display_closing
  end

end

