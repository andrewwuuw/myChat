class ForumsController < ApplicationController
  before_action :find_fourms_id, only: [:edit, :update, :destroy]
  def index
    @forums = Forum.all
    @count = 1
  end

  def show
    @forum = Forum.includes(:messages).find_by(id: params[:id])
    # SELECT * FROM forums
    # SELECT * FROM messages WHERE messages.id IN (1,2,3...)
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)

    if @forum.save
      redirect_to forums_path, notice: "新增成功！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @forum.update(forum_params)
      redirect_to forums_path, notice: "修改成功！"
    else
      render :edit
    end
  end

  def destroy
    if @forum.destroy
      redirect_to forums_path, notice: "刪除成功！"
    end
  end

  private
    def find_fourms_id
      @forum = Forum.find_by(id: params[:id])
    end

    def forum_params
      params.require(:forum).permit(:title, :description)
    end
end
