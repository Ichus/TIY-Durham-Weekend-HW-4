class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  attr_reader :last_post_viewed

  helper_method :current_user
  helper_method :post_viewed
  helper_method :last_post_viewed

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def post_viewed(entry_id)
    posts = Entry.all
    @last_post_viewed = posts.find(entry_id)
  end
end
