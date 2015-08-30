require_relative ('controller')

class Viewer

  def display_greeting
    puts "Welcome to Flashcards!\n This game is case sensitive.\n Press enter to begin!"
    gets_user_input
  end

  def gets_user_input
    gets.chomp
  end

  def display_flashcard(card)
    puts "#{card.definition}"
  end

  def correct_result
    puts "Correct!"
  end

  def incorrect_result
    make_it_nice
    puts "Incorrect. Try again!"
    gets_user_input
  end

  def make_it_nice
    print "\e[H"
    print "\e[2J"
  end

  def display_closing
    puts "You did it! You must feel so good about yourself."
  end
end
