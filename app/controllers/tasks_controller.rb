class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  
  def home
    @tasks = Task.all.order("created_at desc")
  end

  def new
    @task = Task.new  
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @task = find_task
  end

  def edit
    @task = find_task
  end

  def update
    @task = find_task
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = find_task

    if Time.now < find_task.date
      @task.destroy
      redirect_to tasks_url, :notice => I18n.t(:task_kill)
    else
      redirect_to tasks_url, :notice => I18n.t(:task_close)
    end
  end

  def search
    if params[:name]
      @task = Task.search(params[:name]).order("created_at DESC")
    else
      @task = Task.all
    end
  end

private
  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :due_date, :note)
  end
end