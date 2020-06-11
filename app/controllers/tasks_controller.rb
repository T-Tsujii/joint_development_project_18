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
      redirect_to tasks_path, notice: "タスクの投稿に成功しました。"
    else
      flash.now[:alert] = "タスクの作成に失敗しました。"
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクの更新に成功しました。"
    else
      flash.now[:alert] = "タスクの更新に失敗しました。"
      render :edit
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :content)
    end
end
