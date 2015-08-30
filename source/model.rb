require 'csv'
require_relative ('controller')
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
attr_reader :term, :definition

  def initialize(args = {})
    @term = args[:term]
    @definition = args[:definition]
  end
end


class Deck
include DataParser

attr_reader :deck, :completed_cards, :file

  def initialize(file)
    @file = file
    @deck = []
    @completed_cards = []
  end

  def make_deck
    flashcards = DataParser.get_card_info(file)
    flashcards.each do |card|
        deck << Flashcard.new(:term => card[0], :definition => card[1])
      end
    deck
  end

  def shuffle
    deck.shuffle
  end

  def draw_card
    card = deck.shift
    @completed_cards << card
    card
  end
end


class Game
attr_accessor :game_deck, :card

  def initialize(file)
    @game_deck = Deck.new(file)
    @card = nil
  end

  def start
    game_deck.make_deck
  end

  def is_finished?
    game_deck.deck.empty?
  end

  def get_card
    self.card = game_deck.draw_card
  end

  def correct_guess(guess)
    guess == card.term ? true : false
  end
end



