class RunCommentsController < ApplicationController
before_action :authenticate_user!

	def create
		@run = Run.find(params[:run_id])
		@run_comment = RunComment.new(run_comment_params)
		@run_comment.run_id = @run.id
		@run_comment.user_id = current_user.id
		if @run_comment.save
  		redirect_to run_path(@run.id)
		else
		  render 'runs/show'
		end
	end

	def destroy
		@run = Run.find(params[:run_id])
  	run_comment = @run.run_comments.find(params[:id])
		run_comment.destroy
		redirect_to request.referer
	end

	private
	def run_comment_params
		params.require(:run_comment).permit(:comment,:evaluation)
	end
end
