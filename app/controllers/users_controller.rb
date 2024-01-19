class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:users).permit(:email, :encrypted_password, :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :date,)
  end
end
