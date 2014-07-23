class UsersController < ApplicationController
  before_action :set_user, only: [:api_token, :edit, :update, :destroy]
  before_action :authorize, only: [:index, :edit, :update]

  def index
    @user = User.find(current_user.id) if current_user
    @entry = Entry.new
  end

  def show
    @user = User.find(current_user.id) if current_user
    @entries = Entry.where(user_id: @user.id).order(post_date: :desc).page(params[:page]).per(7)
  end

  def api_token
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to log_in_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
