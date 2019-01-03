class TodosController < ApplicationController
  before_action :authenticate

  def index
    @email = session[:current_email]
    @todos = Todo.where(email: @email)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.email = session[:current_email]
    @todo.save
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :email)
  end
end
