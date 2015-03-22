# coding: utf-8
class SessionsController < ApplicationController
  def new
    render layout: 'auth'
  end

  def create
    user = User.find_by_email(params[:email])
    group = Group.find_by(number: params[:number], garden_number: params[:garden_number])
    if user && user.authenticate(params[:password]) && group
      unless group.memberships.find_by(user_id: user.id)
        group.memberships.create(user: user)
      end
      session[:user_id] = user.id
      flash.alert = 'Вхід успішний!'
      redirect_to group_path group
    else
      if group
        flash.now.alert = 'Email або пароль неправильні'
      else
        flash.now.alert = 'Не знайдено групу!'
      end
      render 'new', layout: 'auth'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: 'Ви вийшли!'
  end
end
