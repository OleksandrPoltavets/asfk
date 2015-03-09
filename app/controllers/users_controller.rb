# coding: utf-8
class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: 'auth'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Дякуємо за реєстрацію!'
    else
      render 'new', layout: 'auth'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
