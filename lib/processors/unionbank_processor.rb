class UnionbankProcessor
  class << self
    ROOT_PATH = "https://api-uat.unionbankph.com/partners/sb"
    SANDBOX = "/sandbox/v1/accounts"
    
    def get_sandbox_account
      body = {}
      body[:username] = 'jdelacruz'
      body[:password] = "password"
      body[:account_name] = "Juan Dela Cruz"
      body = JSON.dump(body)

      begin
        response = JSON.parse(RestClient.post(URI.encode(sandbox_url), body), symbolize_names: true)
        response[:msg]
      rescue => e
        puts e
      end        
    end
      
    private

      def headers
        {}.tap do |hash|
          hash['Authorization'] = generate_token
          hash['Content-Type'] = 'application/json;charset=UTF-8'
          hash['Accept'] = 'application/json'
        end
      end

      def sandbox_url
        ROOT_PATH + SANDBOX
      end
  end
end