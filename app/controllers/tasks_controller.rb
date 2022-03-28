class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  before_action :check_login!, except: [:index, :show]
  before_action :find_user_task, only: [:edit, :update, :destroy]
  
  def 
    
  end

  def list
    @tasks = current_user.tasks.order(id: :desc)
  end

  def search
    @tasks = Task.all.order("created_at desc")
    if params[:name]
      @tasks = Task.where("name LIKE ?", "%#{params[:name]}%")
    else  
      @tasks = Task.all
    end
  end

  def new
    @task = Task.new
    @tags = []
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to list_tasks_path
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
    @tags = @task.tags.select("tags.id, tags.name")
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
      redirect_to list_tasks_path, :notice => I18n.t(:task_kill)
    else
      redirect_to list_tasks_path, :notice => I18n.t(:task_close)
    end
  end

private
  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    p = params.require(:task).permit(:name, :due_date, :note, :priority, :tag_tokens)
    p[:status] = params[:task][:status].to_i
    return p
  end

  def find_user_task
    @task = Task.find_by(id: params[:id], user_id: current_user.id)
	end
end