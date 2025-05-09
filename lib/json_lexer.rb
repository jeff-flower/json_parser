module JsonLexer
  class JSONLexer
    def self.lex(string)
      tokens = []
      str_started = false
      str = ''
      string.each_char do |char|
        case identify_char(char)
        when 'LEFT_BRACE'
          tokens << ['{', 'LEFT_BRACE']
        when 'RIGHT_BRACE'
          tokens << ['{', 'RIGHT_BRACE']
        when 'QUOTATION'
          if str_started
            tokens << [str, 'STRING']
            str_started = false
          else
            str_started = true
          end
        when 'CHARACTER'
          str << char
        when 'UNKNOWN'
          tokens << [char, 'UNKNOWN']
        end
      end

      tokens
    end

    # TODO: consider using a map instead
    # i.e. {'{': ['{', 'LEFT_BRACE']}
    def self.identify_char(char)
      case char
      when '{'
        'LEFT_BRACE'
      when '}'
        'RIGHT_BRACE'
      when '"'
        'QUOTATION'
      when /\w/
        'CHARACTER'
      else
        'UNKNOWN'
      end
    end
  end
end
