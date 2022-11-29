class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    logger.debug "get Users"
    render json: users.as_json(only: [:id, :name, :email, :created_at])
  end
end
