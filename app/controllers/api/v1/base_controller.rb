class API::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  respond_to :json

  private

  def authorize(resource, resource_id)
    auth_user = find_auth_user(resource, resource_id)
    unless User.find_by_api_token(params[:api_token]) == auth_user
      render nothing: true, status: :forbidden
    end
  end

  def find_auth_user(resource, resource_id)
    case resource
    when :comment
      comment = Comment.find resource_id
      entry = Entry.find comment.entry_id
      User.find entry.user_id
    when :entry
      entry = Entry.find resource_id
      User.find entry.user_id
    when :user
      User.find_by_api_token params[:api_token]
    else
      raise "find_auth_user only accepts :comment, :entry and :user as arguments"
    end
  end
end
