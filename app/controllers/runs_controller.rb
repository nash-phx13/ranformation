class RunsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_correct_user, only: [:edit, :update, :destroy]

  def show
    @run = Run.find(params[:id])
    @run_comment = RunComment.new
    @run_tags = @run.tags
  end

  def index
    runs = Run.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    @runs = Kaminari.paginate_array(runs).page(params[:page]).per(10)
    @run = Run.new
    @tag_list = Tag.all
  end

  def create
    @run = Run.new(run_params)
    @run.user_id = current_user.id
    tag_list = params[:run]
    if @run.save
       @run.save_tag(tag_list)
       redirect_to run_path(@run), notice: "You have created run recode successfully."
    else
      @runs = Run.all
      render 'index'
    end
  end



  def edit
    @run =Run.find(params[:id])
  end

  def update
    @run =Run.find(params[:id])
    tag_list = params[:run]
    if @run.update(run_params)
       @run.save_tag(tag_list)
       redirect_to run_path(@run), notice: "You have updated run recode successfully."
    else
      render "edit"
    end
  end

  def destroy
    @run.destroy
    redirect_to runs_path
  end

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @runs = @tag.runs.all           #クリックしたタグに紐付けられた投稿を全て表示
  end

  private
  def run_params
    params.require(:run).permit(:title, :body,:image, tag_ids: [])
  end

  def check_correct_user
    @run = Run.find(params[:id])
    unless @run.user == current_user
      redirect_to runs_path
    end
  end
end
