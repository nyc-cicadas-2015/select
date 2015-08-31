require 'csv'
require_relative ('controller') # Your model should _not_ be including your controller
                                # If this is necessary, you're doing something wrong
require 'pry'

module DataParser

  def self.get_card_info(file)
    parsed_data = []
    CSV.foreach(file) do |row|
      parsed_data << row
    end
    parsed_data
  end
end


class Flashcard
  # Indentation!!
  attr_reader :term, :definition

  def initialize(args = {})
    @term = args[:term]
    @definition = args[:definition]
  end
end


class Deck
  # Indentation!!
  include DataParser

  attr_reader :deck, :file

  def initialize(file)
    @file = file
    @deck = []
    @completed_cards = []
  end

  # The reason we use an external module for parsing is to avoid tightly
  # coupled classes.  By instantiating your Flashcard instance within the Deck
  # class, you are ensuring that the Deck object can only ever use this type
  # of Flashcard.  Ruby methodology says that "as long as it responds to the
  # proper methods, its ok...", meaning that it should not matter what kind of
  # card object it is, as long as it adheres to a known interface.
  #
  # Better would be to have your DataParser module eat CSV's and spit out an
  # array of Flashcard objects
  #
  def make_deck
    flashcards = DataParser.get_card_info(file)
    flashcards.each do |card|
        deck << Flashcard.new(:term => card[0], :definition => card[1])
      end
    deck
  end

  def shuffle
    deck.shuffle!
  end

  def draw_card
    card = deck.shift
    @completed_cards << card
    card
  end
end


class Game
  # Indentation!!
  attr_accessor :game_deck, :card

  def initialize(file)
    @game_deck = Deck.new(file)
    @card = nil
  end

  # If your method changes some state internally, you may want to use a '!' at the end
  # of the name
  def start
    game_deck.make_deck
    game_deck.shuffle
  end

  def is_finished?
    game_deck.deck.empty?
  end

  def get_card
    self.card = game_deck.draw_card
  end

  # Make your interogative methods looks so with a '?' trailing the method name!
  def correct_guess(guess)
    guess == card.term ? true : false
  end
end



