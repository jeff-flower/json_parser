# JsonParser module
module JsonParser
  class JSONParser
    def self.valid?(raw_string)
      string = raw_string.chomp.strip

      string.start_with?('{') && string.end_with?('}')
    end
  end
end
