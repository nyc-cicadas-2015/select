require_relative ('controller')

module Viewer

  def self.display_greeting
    puts "Welcome to Flashcards!\n This game is case sensitive.\n Press enter to begin!"
    gets_user_input
  end

  def self.gets_user_input
    gets.chomp
  end

  def self.display_flashcard

  end

  def self.display_result

  end
end
