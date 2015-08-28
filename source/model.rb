require 'csv'

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

  def initialize(*deck)
    @deck = deck
  end

  def make_deck(data)
    data.each do |card|
      @deck << Flashcard.new(:term => card[0], :definition => card [1])
    end
    @deck
  end
end


class Game

  def initialize

  end
end


my_data = DataParser.get_card_info("flashcards.csv")
p my_data

my_deck = Deck.new
p my_deck.make_deck(my_data)
