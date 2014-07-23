class API::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  respond_to :json

  private

  def authorize
    render nothing: true, status: :forbidden unless User.find_by_api_token(params[:api_token])
  end
end
