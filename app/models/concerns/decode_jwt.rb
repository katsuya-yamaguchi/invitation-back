require 'net/http'
require 'uri'
require 'json'
require 'jwt'

module DecodeJwt
  extend ActiveSupport::Concern

  class << self
    def decode(token)
      pubkey = get_pubkey
      begin
        encode_data = JWT.decode(token, pubkey, false, { algorithm: 'RS256' })
        encode_data[0]
      rescue => e
        logger.error e
        encode_data = nil
      end
    end

    def get_pubkey
      uri = URI.parse('https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com')
      request = Net::HTTP.new(uri.host, uri.port)
      request.use_ssl = true
      response = request.start {
        request.get(uri.request_uri)
      }
      JSON.parse(response.body)
    end
  end
end
