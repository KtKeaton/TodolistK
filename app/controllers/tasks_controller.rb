class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all.order("created_at desc")
    @status_name = Task.distinct(:status).order(:status)
    if params[:name]
      @tasks = Task.where("name LIKE ?", "%#{params[:name]}%")
    else
      @tasks = Task.all
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show
    @task = find_task
    @tasks = Task.all.order("created_at desc")
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

    if Time.now < find_task.due_date
      @task.destroy
      redirect_to root_path, :notice => I18n.t(:task_kill)
    else
      redirect_to root_path, :notice => I18n.t(:task_close)
    end
  end

private
  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    p = params.require(:task).permit(:name, :due_date, :note, :priority)
    p[:status] = params[:task][:status].to_i
    return p
  end
end