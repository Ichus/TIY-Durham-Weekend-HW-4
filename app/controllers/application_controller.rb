class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in_redirect
  helper_method :set_entry_comments

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_redirect
    if current_user
      redirect_to users_path
    end
  end

  def set_entry_comments
    entry = Entry.find(params[:id])
    @entry_comments = Comment.where(entry_id: entry.id).order(post_date: :asc)
  end
end
