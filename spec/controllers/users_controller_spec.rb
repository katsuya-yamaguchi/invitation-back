require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST #create' do
    context 'when the allergy status change process is successful,' do
      it 'has 200 status code.' do
        user = instance_double(User)
        allow(User).to receive(:new).and_return(user)
        allow(user).to receive(:change_allelgy_status).and_return(0)
        post :create
        expect(response).to have_http_status(200)
      end
    end

    context 'when the allergy status change process is failed,' do
      it 'has 400 status code.' do
        user = instance_double(User)
        allow(User).to receive(:new).and_return(user)
        allow(user).to receive(:change_allelgy_status).and_return(1)
        post :create
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when the attend status change process is successful,' do
      it 'has 200 status code.' do
        user = instance_double(User)
        allow(User).to receive(:new).and_return(user)
        allow(user).to receive(:change_attend_status).and_return(0)
        patch :update
        expect(response).to have_http_status(200)
      end
    end

    context 'when the attend status change process is successful,' do
      it 'has 400 status code.' do
        user = instance_double(User)
        allow(User).to receive(:new).and_return(user)
        allow(user).to receive(:change_attend_status).and_return(1)
        patch :update
        expect(response).to have_http_status(400)
      end
    end
  end
end
