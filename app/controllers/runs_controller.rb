class RunsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_correct_user, only: [:edit, :update, :destroy]

  def show
    @run = Run.find(params[:id])
    @run_comment = RunComment.new
  end

  def index
    @runs = Run.all
    @run = Run.new
  end

  def create
    @run = Run.new(run_params)
    @run.user_id = current_user.id
    if @run.save
      redirect_to run_path(@run), notice: "You have created run recode successfully."
    else
      @runs = Run.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @run.update(run_params)
      redirect_to run_path(@run), notice: "You have updated run recode successfully."
    else
      render "edit"
    end
  end

  def destroy
    @run.destroy
    redirect_to runs_path
  end

  private

  def run_params
    params.require(:run).permit(:title, :body, { images: [] })
  end

  def check_correct_user
    @run = Run.find(params[:id])
    unless @run.user == current_user
      redirect_to runs_path
    end
  end
end
