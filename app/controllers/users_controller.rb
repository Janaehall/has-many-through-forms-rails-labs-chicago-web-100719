class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
    @posts = @comments.map{|c| c.post}.uniq
  end

end
