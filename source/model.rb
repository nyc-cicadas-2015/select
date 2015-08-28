require 'csv'
require_relative ('controller')

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
attr_reader :deck
  def initialize(*data)
    @deck = []
    data.each do |array|
      array.each do |card|
        @deck << Flashcard.new(:term => card[0] , :definition => card[1])
      end
    end
    @deck
  end
end


class Game
attr_reader :game
  def initialize
    @game = Deck.new(DataParser.get_card_info("flashcards.csv"))
  end




end


my_data = DataParser.get_card_info("flashcards.csv")
my_data

my_deck = Deck.new(my_data)
p my_deck
