class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @run = Run.find(params[:run_id])
    like = @run.likes.new(user_id: current_user.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    @run = Run.find(params[:run_id])
    like = @run.likes.find_by(user_id: current_user.id)
    like.destroy
    redirect_to request.referer
  end
end
