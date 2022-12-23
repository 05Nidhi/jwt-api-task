# This shiny device polishes bared foos
# frozen_string_literal: true

# Service to download ftp files from the server
class LoginController < ApplicationController
  before_action :find_user

  def create
    if @user.authenticate(params[:password])
      render json: { user: @user, message: 'login sucessfull' }, status: 201
    else
      render json: { message: 'wrong password' }, status: 404
    end
  end

  private

  def find_user
    @user = User.find_by_email(params[:email])

    return unless @user.nil?

    render json: {
      message: 'wrong email'
    }, status: 404
  end
end
