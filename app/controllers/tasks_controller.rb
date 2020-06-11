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

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      redirect_to tasks_path, notice: "タスクの削除に成功しました。"
    else
      redirect_to tasks_path, alert: "タスクの削除に失敗しました。"
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :content)
    end
end
