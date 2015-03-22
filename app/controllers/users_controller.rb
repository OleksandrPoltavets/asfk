# coding: utf-8
class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: 'auth'
  end

  def create
    @user = User.new(user_params)
    if params[:number].blank? && params[:garden_number].blank?
      flash.alert = 'Вкажіть номер групи та садочка'
      render 'new', layout: 'auth'
    else
      @group = Group.find_by(number: params[:number], garden_number: params[:garden_number])
      if @user.save
        # binding.pry

        if @group
          @user.memberships.create(group: @group, approved: false)
        else
          @group = Group.create(number: params[:number], garden_number: params[:garden_number])
          @user.memberships.create(group: @group, approved: true)
        end

        session[:user_id] = @user.id
        flash.alert = 'Дякуємо за реєстрацію!'
        redirect_to group_path @group
      else
        render 'new', layout: 'auth'
      end
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
