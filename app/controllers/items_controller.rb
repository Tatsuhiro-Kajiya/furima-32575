class ItemsController < ApplicationController
  #before_action :authenticate_user!
  def index
  end

  def new
    @use = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end
end
