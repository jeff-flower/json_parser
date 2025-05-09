# JsonParser module
module JsonParser
  class JSONParser
    def self.valid?(string)
      # string.start_with?('{') && string.end_with?('}')
      # this is a terrible idea
      re = /^{\s*"?\w*"?\s*:?\s*"?\w*"?}/
      re.match?(string)
    end
  end
end
