class OauthcallbacksController < ApplicationController
  def facebook
      @user = User.find_or_create_by({
        provider: request.env['omniauth.auth'][:provider],
        uid:      request.env['omniauth.auth'][:uid]
      })
      sign_in(@user)
      redirect_to "root#root"
      # redirect_to user_url(@user)
  end
end
