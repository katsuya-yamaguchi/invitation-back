require 'rails_helper'
require 'json'

RSpec.describe User, type: :model do
  describe 'change_attend_status' do
    let(:json_data){
      json_data = {
        email: 'test@test.com',
        user_id: '0123456789',
        status: '0'
      }
      JSON.generate(json_data)
    }

    context 'when attend_status update failed,' do
      it 'returns 1.' do
        allow(DecodeJwt).to receive(:decode).and_return(json_data)
        allow(User).to receive(:where).and_return(nil)
        user = User.new
        user.save!

        result = user.change_attend_status(json_data)
        expect(result).to eq 1
      end
    end

    context 'when attend_status update is successful,' do
      it 'returns 0.' do
        allow(DecodeJwt).to receive(:decode).and_return(json_data)
        user = User.new(email: 'test@test.com')
        user.save!

        result = user.change_attend_status(JSON.generate(json_data))
        expect(result).to eq 0
      end
    end
  end

  describe 'change_allelgy_status' do
    let(:json_data){
      json_data = {
        email: 'test@test.com',
        user_id: '0123456789',
        status: '0'
      }
      JSON.generate(json_data)
    }

    context 'when allelgy_status update failed,' do
      it 'returns 1.' do
        allow(DecodeJwt).to receive(:decode).and_return(json_data)
        allow(User).to receive(:where).and_return(nil)
        user = User.new
        user.save!

        result = user.change_allelgy_status(json_data)
        expect(result).to eq 1
      end
    end

    context 'when allelgy_status update is successful,' do
      it 'returns 0.' do
        allow(DecodeJwt).to receive(:decode).and_return(json_data)
        user = User.new(email: 'test@test.com')
        user.save!

        result = user.change_allelgy_status(JSON.generate(json_data))
        expect(result).to eq 0
      end
    end
  end
end
