require 'rails_helper'

require 'jwt'

describe 'decode' do
  it 'successful decoding of token.' do
    token = ENV['TOKEN']
    expect(DecodeJwt.decode(token)).not_to eq nil
  end
end

describe 'get_pubkey' do
  it 'response is not nil.' do
    expect(DecodeJwt.get_pubkey).not_to eq nil
  end
end
