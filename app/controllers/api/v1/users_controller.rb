class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      set_refresh_token_to_cookie
      render json: signup_response
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password_digest)
    end

   # サインアップ時のデフォルトレスポンス
   def signup_response
    {
      token: access_token,
      expires: access_token_expiration,
      user: @user.response_json(sub: access_token_subject)
    }
  end

end
