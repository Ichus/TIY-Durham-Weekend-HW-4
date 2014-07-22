class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_entry_comments, only: [:show]
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = current_user.entries.build(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = @entry.user
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Entry was successfully destroyed.' }
    end
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id) if current_user
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :post_date, :user_id)
  end
end
