class API::V1::CommentsController < API::V1::BaseController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_entry, only: [:create]
  before_action only: [:update, :destroy] do
    authorize(:comment, @comment.id)
  end

  def create
    @comment = @entry.comments.build(comment_params)

    if @comment.save
      render :nothing => true, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render :nothing => true, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    render :nothing => true, :status => :no_content
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_entry
      @entry = Entry.find(params[:entry_id])
    end

    def comment_params
      params.require(:comment).permit(:name, :description, :post_date, :entry_id)
    end

end
