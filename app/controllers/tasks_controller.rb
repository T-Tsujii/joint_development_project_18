class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # index実装後にtasks_pathに変更
      redirect_to new_task_path, notice: "タスクの投稿に成功しました。"
    else
      flash.now[:alert] = "タスクの作成に失敗しました。"
      render :new
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :content)
    end
end
