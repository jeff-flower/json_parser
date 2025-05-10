require './lib/json_lexer'

describe JsonLexer do
  describe '#lex' do
    context 'when the input is curly braces' do
      it 'identifies a left curly brace' do
        tokens = JsonLexer::JSONLexer.lex('{')
        expect(tokens).to eq([['{', 'LEFT_BRACE']])
      end

      it 'identifies a right curly brace' do
        tokens = JsonLexer::JSONLexer.lex('}')
        expect(tokens).to eq([['}', 'RIGHT_BRACE']])
      end

      it 'identifies "{}"' do
        tokens = JsonLexer::JSONLexer.lex('{}')
        expect(tokens).to eq([['{', 'LEFT_BRACE'], ['}', 'RIGHT_BRACE']])
      end
    end

    context 'when the input is a string' do
      it 'identifies a string' do
        tokens = JsonLexer::JSONLexer.lex('"test"')
        expect(tokens).to eq([%w[test STRING]])
      end
    end

    context 'when the input is a colon' do
      it 'identifies a colon' do
        tokens = JsonLexer::JSONLexer.lex(':')
        expect(tokens).to eq([[':', 'COLON']])
      end
    end

    context 'when the input is whitespace' do
      it 'ignores spaces' do
        tokens = JsonLexer::JSONLexer.lex(32.chr)
        expect(tokens).to eq([])
      end

      it 'ignores tab' do
        tokens = JsonLexer::JSONLexer.lex(9.chr)
        expect(tokens).to eq([])
      end

      it 'ignores carriage return' do
        tokens = JsonLexer::JSONLexer.lex(13.chr)
        expect(tokens).to eq([])
      end

      it 'ignores new line' do
        tokens = JsonLexer::JSONLexer.lex(10.chr)
        expect(tokens).to eq([])
      end
    end

    context 'with combinations of tokens' do
      it 'identifies a string-string pair' do
        tokens = JsonLexer::JSONLexer.lex('"key":"value"')
        expect(tokens).to eq([%w[key STRING], [':', 'COLON'], %w[value STRING]])
      end

      it 'identifies a string-string pair with whitespace' do
        tokens = JsonLexer::JSONLexer.lex(' "key" : "value" ')
        expect(tokens).to eq([%w[key STRING], [':', 'COLON'], %w[value STRING]])
      end

      it 'identifies a string-string pair inside curly braces' do
        tokens = JsonLexer::JSONLexer.lex('{"key":"value"}')
        expect(tokens).to eq([['{', 'LEFT_BRACE'], %w[key STRING], [':', 'COLON'], %w[value STRING], ['}', 'RIGHT_BRACE']])
      end

      it 'identifies a string-string pair inside curly braces with whitespace' do
        tokens = JsonLexer::JSONLexer.lex('{ "key" : "value" }')
        expect(tokens).to eq([['{', 'LEFT_BRACE'], %w[key STRING], [':', 'COLON'], %w[value STRING], ['}', 'RIGHT_BRACE']])
      end
    end
  end
end
