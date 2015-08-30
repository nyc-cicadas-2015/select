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
  let(:my_deck){Deck.new("flashcards.csv")}

  describe ".Deck" do
    it "should be an array of objects" do
      expect(my_deck.make_deck.size).to eq(4)
    end
  end

  describe "#shuffle" do
    it "should shuffle the deck of cards" do
      expect(my_deck.shuffle).not_to eq(my_deck)
    end
  end
end


describe ".Game" do
  let(:my_game){Game.new("flashcards.csv")}

 describe "#start" do
    it "should create an array of card objects" do
      expect(my_game.start).to be_an(Array)
    end
  end

  describe "#finished?" do
    it "should determine if the deck is empty" do
      expect((my_game.is_finished?).to be_falsey
    end
  end
end
