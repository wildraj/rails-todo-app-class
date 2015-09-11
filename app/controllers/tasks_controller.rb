class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def uncomplete
    @task = Task.find(params[:id])
    @task.checked = false
    @task.save
    redirect_to tasks_path
  end

  def complete
    @task = Task.find(params[:id])
    @task.checked = true
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def create
    p "*"*50
    p task_params
    p "*"*50

    @task = Task.new(params.require(:task).permit(:name))

    @task.save
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name,:checked)
  end
end
