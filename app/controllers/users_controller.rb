class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :update, :destroy]

  # POST /user
  def create
    data = request.body.string
    user = User.new
    if user.change_allelgy_status(data) == 0 then
      render nothing: true, status: 200
    elsif 
      render nothing: true, status: 400
    end
  end

  # PATCH/PUT /user
  def update
    data = request.body.string
    user = User.new
    if user.change_attend_status(data) == 0 then
      render nothing: true, status: 200
    elsif 
      render nothing: true, status: 400
    end
  end
end