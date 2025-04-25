require './lib/json_parser'

describe JsonParser do
  describe '#valid?' do
    # this needs to run from the command line, I'm thinking we can worry about that later
    it 'recognizes {} as valid JSON' do
      input = '{}'

      expect(JsonParser::JSONParser.valid?(input)).to be true
    end

    it 'recognizes {{ as invalid JSON' do
      input = '{{'

      expect(JsonParser::JSONParser.valid?(input)).to be false
    end

    # NEXT: use tests from dropbox (see link in challenge)
  end
end
