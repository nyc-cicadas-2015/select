require 'csv'

#CSV Parser
#Flashcard_maker
#Flashcard(:term, :definition)

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
