# require 'byebug'
# require 'jwt'
# require 'jwt_web_token'

class ApplicationController < ActionController::API
  # before_action :expiration

  private
  def expiration
    begin
      user_id = JwtWebToken.jwt_decode(params[:token])['id']
      user=User.find(user_id)
      render json: {user:user,message:"Valid Token"}
    rescue JWT::ExpiredSignature
      render json: { error: 'Token has expired' }
    end
  end
end
