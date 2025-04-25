# JsonParser module
module JsonParser
  class JSONParser
    def self.valid?(string)
      string.start_with?('{') && string.end_with?('}')
    end
  end
end
