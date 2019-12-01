require 'rails_helper'

describe VideosController, type: :controller do
  let(:user) { User.create(email: 'test@mail.com', password: 'HelloWorld123') }

  before do
    sign_in user
  end

  describe 'GET #index' do
  end

  describe 'GET #new' do
    it 'should return success' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
  end
end