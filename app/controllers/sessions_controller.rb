# coding: utf-8
class SessionsController < ApplicationController
  def new
    render layout: 'auth'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Вхід успішний!'
    else
      flash.now.alert = 'Email або пароль неправильні'
      render 'new', layout: 'auth'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url, layout: 'auth', notice: 'Ви вийшли!'
  end
end
