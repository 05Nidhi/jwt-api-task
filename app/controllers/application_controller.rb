# frozen_string_literal: true

# rubocop:enable
class ApplicationController < ActionController::API
  # before_action :expiration

  private

  def expiration
    user_id = JwtWebToken.jwt_decode(params[:token])['id']
    @user = User.find(user_id)
    # render json: {user:user,message:"Valid Token"}
  rescue JWT::ExpiredSignature
    render json: { error: 'Token has expired' }
  end
end
