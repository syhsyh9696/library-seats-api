class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path, notice: "Update Success"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:alert] = "Task deleted"
    redirect_to tasks_path
  end

  def create
    @task = Task.new(task_params)
    @task.save if Seat.find(task_params[:seat])

    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def checkin
    @available = []; @token = []
    @tasks = Task.all; @hour = Time.new.hour
    @range = @hour * 60..(@hour + 1) * 60

    @tasks.each do |task|
      @available << task if @range === task.start.to_i
    end

    @available.each do |task|
      @token << task.token
    end

    render :json => @token, :callback => params[:callback]
  end

  private
  def task_params
    params.require(:task).permit(:username, :password, :start, :end, :seat, :remark)
  end
end
