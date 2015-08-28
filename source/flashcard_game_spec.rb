require_relative('model')

describe DataParser do
  let(:my_data){DataParser.get_card_info("flashcards.csv")}
  describe "#get_card_info" do
    it "should return an Array" do
      expect(my_data).to be_an(Array)
    end
  end
end


describe Flashcard do
  let(:my_flashcard){Flashcard.new(term: "boolean", definition: "true or false")}
  describe "#create card" do
    it "should return hash values" do
      expect(my_flashcard.term).to eq("boolean")
    end
  end
end

describe Deck do
let(:my_data){DataParser.get_card_info("flashcards.csv")}
let(:my_deck){Deck.new(my_data)}

  describe ".Deck" do
    it "should be an array of objects" do
      expect(my_deck.deck.size).to eq(4)
    end
  end
end
