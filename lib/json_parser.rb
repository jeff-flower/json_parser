require './lib/json_lexer'

# JsonParser module
module JsonParser
  class JSONParser
    def self.valid?(string)
      return false unless string.length.positive?

      stack = []
      tokens = JsonLexer::JSONLexer.lex(string)
      tokens.each do |token|
        # ???
        token_type = token[1]
        case token_type
        when 'LEFT_BRACE'
          stack.push(token)
        when 'RIGHT_BRACE'
          stack.pop
        end
      end

      stack.empty?

      # OLD
      # string.start_with?('{') && string.end_with?('}')
      # this is a terrible idea
      # re = /^{\s*"?\w*"?\s*:?\s*"?\w*"?}/
      # re.match?(string)
    end
  end
end
