class API::V1::UsersController < API::V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action only: [:update, :destroy] do
    authorize(:user, nil)
  end

  def index
    @users = User.all.page(params[:page]).per(50)
  end

  def show
    @entries = Entry.where(user_id: @user.id).order(post_date: :desc).page(params[:page]).per(10)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render :nothing => true, :status => :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
