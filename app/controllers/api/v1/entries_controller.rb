class API::V1::EntriesController < API::V1::BaseController
  before_action :set_entry, only: [:show, :update, :destroy]
  before_action :set_entry_comments, only: [:show]
  before_action only: [:update, :destroy] do
    authorize(:entry, @entry.id)
  end
  before_action only: :create do
    authorize(:user, nil)
  end

  def show
  end

  def create
    user = User.find_by_api_token(params[:api_token])
    @entry = user.entries.build(entry_params)

    if @entry.save
      render :show, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      render :show, status: :ok
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    render :nothing => true, :status => :no_content
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :post_date, :user_id)
  end
end
