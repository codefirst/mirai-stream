class AuthenticationController < ApplicationController
  skip_before_filter :authenticate_user!

  def login
  end

  def flickr
    oauth = request.env['omniauth.auth']
    user = User.where(uid: oauth.uid).first
    if user
      user.name = oauth.info.name
      user.nickname = oauth.info.nickname
      user.image_url = oauth.info.image
    else
      user = User.new(uid: oauth.uid, name: oauth.info.name, nickname: oauth.info.nickname, image_url: oauth.info.image)
    end
    user.save
    sign_in_and_redirect user,:event => :authentication
  end

  def logout
    sign_out current_user
    redirect_to root_path
  end
end
