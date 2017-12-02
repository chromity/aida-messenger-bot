class PseiProcessor  
  class << self
    def request_market(date)  
      market_url = "http://pseapi.com/api/Market/#{date.strftime("%m-%d-%Y")}"
      RestClient.get market_url do |response|
        result = JSON.parse(response)
      end
    end

    def request_sector(date)  
      market_url = "http://pseapi.com/api/Sector/#{date.strftime("%m-%d-%Y")}"
      RestClient.get market_url do |response|
        result = JSON.parse(response)
      end
    end

    def headers
      {}.tap do |hash|
        hash['Content-Type'] = 'application/json;charset=UTF-8'
        hash['Accept'] = 'application/json'
      end
    end

  end
end