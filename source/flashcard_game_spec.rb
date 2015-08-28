require_relative('model')

describe DataParser do
  let(:my_data){DataParser.get_card_info("flashcards.csv")}
  describe "#get_card_info" do
    it "should return an Array" do
      expect(my_data).to be_an(Array)
    end
  end
end
