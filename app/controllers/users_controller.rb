class UsersController < ApplicationController
  def create
    user = User.find_by_email(email)

    if user
      if user.valid_password?(password)
        sign_in_with!(user)
      else
        flash[:error] = 'Invalid password'
      end
    else
      user = User.new(user_params)
      if user.save
        sign_in_with!(user)
      else
        flash[:error] = 'Sorry we cannot process your request at the moment'
      end
    end

    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def email
      params[:user][:email]
    end

    def password
      params[:user][:password]
    end

    def sign_in_with!(user)
      sign_in(user)
      flash[:notice] = 'Logged in successfully'
    end
end
