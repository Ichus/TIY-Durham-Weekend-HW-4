class API::V1::EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]
  before_action :set_entry_comments, only: [:show]
  before_action :authorize, only: [:create, :update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :json

  def show
  end

  def create
    @entry = current_user.entries.build(entry_params)

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
