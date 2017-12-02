class HmacProcessor

  def initialize
    @nonce = DateTime.now.strftime('%s')
  end

  def nonce
    @nonce
  end

  def self.signature(url, nonce, key, body = nil)
    if body.present?
      message = nonce + url + body.strip
    else
      message = nonce + url
    end

    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), key, message)
  end
end
