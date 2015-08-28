
module DataParser

  def self.get_card_info(file)
    parsed_data = []
    File.readlines(file).each do |row|
      parsed_data << row
    end
    parsed_data
  end
end

my_data = DataParser.get_card_info("flashcards.txt")
p my_data

class Flashcard
attr_reader :term, :definition
  def initialize(term, definition)
    @term = term
    @definition = definition
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
