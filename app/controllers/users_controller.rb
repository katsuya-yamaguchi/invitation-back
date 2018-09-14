class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :update, :destroy]

  # POST /user
  #def create
  #  @user = User.new(user_params)

  #  if @user.save
  #    render json: @user, status: :created, location: @user
  #  else
  #    render json: @user.errors, status: :unprocessable_entity
  #  end
  #end

  # PATCH/PUT /user
  def update
    data = request.body.string
    user = User.new
    if user.changeAttendStatus(data) == 0 then
      render nothing: true, status: 200
    elsif 
      render nothing: true, status: 400
    end
  end

  #private
  #  # Use callbacks to share common setup or constraints between actions.
  #  def set_user
  #    @user = User.find(params[:id])
  #  end

  #  # Only allow a trusted parameter "white list" through.
  #  def user_params
  #    params.fetch(:user, {})
  #  end
end