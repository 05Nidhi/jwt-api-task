# require 'byebug'
# require 'jwt'
# require 'jwt_web_token'

class ApplicationController < ActionController::API
  # include JwtToken

  # before_action :authenticate_user

  # private
  #   def authenticate_user
  #     header=request.headers['Authorization']
  #     header=header.split(' ').last if header
  #     begin
  #       @decoded =JwtToken.jwt_decode(header)
  #       @current_user=User.find(@decoded[:user_id])
  #     rescue ActiveRecord::RecordNotFound => e
  #       render json: {erors:e.message},status: :unauthorized
  #     rescue JWT::DecodeError => e
  #       render json: {erors:e.message},status: :unauthorized
  #     end
  #   end
end
