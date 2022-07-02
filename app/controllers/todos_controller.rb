class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end 
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if  @todo.save
        flash[:notice] = "Post successfully created"
        redirect_to todo_path(@todo)
    else
      render("new")
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end 
  def edit
    if Todo.exists?(params[:id])
      @todo = Todo.find(params[:id])
    else
      flash[:alert] = "Post not  found!"
      redirect_to todos_path
    end
  end 

  def update
  end 

  private
    def todo_params
      params.require(:todo).permit(:name, :description, :start_dt, :end_dt, :iscompleted)
    end
end 