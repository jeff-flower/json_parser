require './lib/json_parser'

describe JsonParser do
  describe '#valid?' do
    # this needs to run from the command line, I'm thinking we can worry about that later
    context 'Step 1' do
      it 'recognizes {} as valid JSON' do
        input = '{}'

        expect(JsonParser::JSONParser.valid?(input)).to be true
      end

      it 'recognizes {{ as invalid JSON' do
        input = '{{'

        expect(JsonParser::JSONParser.valid?(input)).to be false
      end

      it 'recognizes an empty string as invalid JSON' do
        input = ''

        expect(JsonParser::JSONParser.valid?(input)).to be false
      end
    end

    context 'Step 2' do
      it 'recognizes {"key": "value",} as invalid JSON' do
        input = '{"key": "value",}'

        expect(JsonParser::JSONParser.valid?(input)).to be false
      end

      it 'recognizes {"key": "value"} as valid JSON' do
        input = '{"key": "value"}'

        expect(JsonParser::JSONParser.valid?(input)).to be true
      end

      it 'recognizes a non-string key as invalid json' do
        input = '{"key": "value",\nkey2: "value"}'

        expect(JsonParser::JSONParser.valid?(input)).to be false
      end

      it 'recognizes two key-value pairs as valid json' do
        input = '{"key": "value",\n"key2": "value"}'

        expect(JsonParser::JSONParser.valid?(input)).to be true
      end

      # NEXT: Test cases for spec/testCases/step2/invalid2.json and valid2.json
    end

    # NEXT: use tests from dropbox (see link in challenge)
  end
end
