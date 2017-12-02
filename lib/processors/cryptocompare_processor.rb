class CryptocompareProcessor  
  class << self
    def get_data(symbol)
      history_url = "https://min-api.cryptocompare.com/data/histoday?fsym=#{symbol}&tsym=USD&limit=1000&aggregate=3&e=CCCAGG"
      RestClient.get history_url do |response|
        result = JSON.parse(response)
      end
    end
  end
end