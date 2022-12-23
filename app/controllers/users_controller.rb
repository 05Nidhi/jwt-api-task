# This shiny device polishes bared foos
# frozen_string_literal: true

# Service to download ftp files from the server
class UsersController < ApplicationController
  include JwtWebToken

  before_action :expiration, only: %i[show update destroy]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: { user: @user, message: 'valid token' }, status: 201
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def update
    @user.update(user_params)
    render json: { user: @user, message: 'valid token' }, status: 201
  end

  def destroy
    @user.destroy
    render json: { user: @user, message: 'valid token' }, status: 201
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
