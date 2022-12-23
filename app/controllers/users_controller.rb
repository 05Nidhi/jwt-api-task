# This shiny device polishes bared foos
# frozen_string_literal: true

# Service to download ftp files from the server
class UsersController < ApplicationController
  # skip_before_action :authenticate_user ,only:[:create,:index,:update,:show,:destroy]
  # before_action :find_user ,only:[:show,:update,:destroy]
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    message = if @user.update(user_params)
                'User has been updated.'
              else
                'User has not been updated.'
              end
    render json: { user: @user, message: message }, status: 201
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user, status: 201
  end

  private

  # def find_user
  #   @user = User.find_by_username!(params[:_username])
  #   rescue ActiveRecord::RecordNotFound
  #     render json: { errors: 'User not found' }, status: :not_found
  # end

  def user_params
    params.permit(:email, :password)
  end
end
