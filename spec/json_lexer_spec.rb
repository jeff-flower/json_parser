require './lib/json_lexer'

describe JsonLexer do
  describe '#lex' do
    context 'when input is curly braces' do
      it 'recognizes a left curly brace' do
        tokens = JsonLexer::JSONLexer.lex('{')
        expect(tokens).to eq([['{', 'LEFT_BRACE']])
      end

      it 'recognizes a right curly brace' do
        tokens = JsonLexer::JSONLexer.lex('}')
        expect(tokens).to eq([['{', 'RIGHT_BRACE']])
      end

      it 'recognizes "{}"' do
        tokens = JsonLexer::JSONLexer.lex('{}')
        expect(tokens).to eq([['{', 'LEFT_BRACE'], ['{', 'RIGHT_BRACE']])
      end
    end

    context 'when input is string' do
      it 'recognizes a string' do
        tokens = JsonLexer::JSONLexer.lex('"test"')
        expect(tokens).to eq([%w[test STRING]])
      end
    end

    # make string pass with lexer
    # - [ ] recognize string
    # - [ ] colon
    # - [ ] ignore white space
    # - [ ] anything else is marked 'UNKNOWN'
  end
end
