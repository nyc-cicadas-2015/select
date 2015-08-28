
module DataParser

  def self.get_card_info(file)
    parsed_data = []
    File.readlines(file).map do |row|
      parsed_data << row.split("\n")
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

  def initialize

  end
end


class Game

  def initialize

  end
end


my_data = DataParser.get_card_info("flashcards.txt")
my_flashcard = Flashcard.new(:term => "Boolean", :definition => "True or False")
p my_flashcard
