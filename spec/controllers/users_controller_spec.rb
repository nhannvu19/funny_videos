require 'rails_helper'

describe UsersController, type: :controller do
  let(:user_params) {
    {
      email: 'test@mail.com',
      password: 'HelloWorld123'
    }
  }

  let(:invalid_email_params) {
    {
      email: 'this_is_invalid_email',
      password: 'CorrectPasswordDoesntMeanAnything'
    }
  }

  let(:invalid_password_params) {
    {
      email: 'test@mail.com',
      password: 'ThisIsIncorrectPassword'
    }
  }

  describe 'POST #create' do
    context 'new user' do
      context 'valid params' do
        it 'should register new user' do
          post :create, params: { user: user_params }
          expect(response).to have_http_status :redirect
          
          user = User.last
          expect(user.email).to eq user_params[:email]
        end
      end

      context 'valid params' do
        it 'should not register new user' do
          post :create, params: { user: invalid_email_params }
          expect(response).to have_http_status :redirect

          user = User.find_by_email(invalid_email_params[:email])
          expect(user).to be_nil
          expect(flash[:error]).to eq 'Sorry we cannot process your request at the moment'
        end
      end
    end

    context 'existing user' do
      let!(:user) { User.create(user_params) }

      context 'valid password' do
        it 'should redirect with flash error' do
          post :create, params: { user: user_params }

          expect(response).to have_http_status :redirect
          expect(flash[:notice]).to eq 'Logged in successfully'
        end
      end

      context 'incorrect password' do
        it 'should redirect with flash error' do
          post :create, params: { user: invalid_password_params }

          expect(response).to have_http_status :redirect
          expect(flash[:error]).to eq 'Invalid password'
        end
      end
    end
  end
end
