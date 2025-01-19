class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :update, :destroy ]

  swagger_api :index do
    summary "Fetches all tasks"
    response :ok, "Success", :array, "Task"
  end

  def index
    @tasks = Task.all
    render json: @tasks
  end

  swagger_api :show do
    summary "Shows a task"
    param :path, :id, :integer, :required, "Task ID"
    response :ok, "Success", "Task"
    response :not_found, "Not Found"
  end
  def show
    render json: @task
  end

  swagger_api :create do
    summary "Creates a new task"
    param :form, :title, :string, :required, "Title of the task"
    param :form, :name, :string, :required, "Name of the task"
    param :form, :completed, :boolean, :required, "Completion status"
    param :form, :description, :string, :optional, "Description of the task"
    response :created, "Task created", "Task"
    response :unprocessable_entity, "Invalid input"
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  swagger_api :update do
    summary "Updates an existing task"
    param :path, :id, :integer, :required, "Task ID"
    param :form, :title, :string, :optional, "Title of the task"
    param :form, :name, :string, :optional, "Name of the task"
    param :form, :completed, :boolean, :optional, "Completion status"
    param :form, :description, :string, :optional, "Description of the task"
    response :ok, "Task updated", "Task"
    response :unprocessable_entity, "Invalid input"
  end
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  swagger_api :destroy do
    summary "Deletes a task"
    param :path, :id, :integer, :required, "Task ID"
    response :no_content, "Task deleted"
    response :not_found, "Not Found"
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :name, :completed, :description)
  end
end
