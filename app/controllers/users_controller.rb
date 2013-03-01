class UsersController < ApplicationController
  
  # REV: Try to be consistent in your use of new lines, stick to one convention, looks better :)
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end