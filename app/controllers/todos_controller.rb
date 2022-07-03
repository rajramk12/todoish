class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destroy] 
  def index
    @todos = Todo.all
  end 
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if  @todo.save
        flash[:notice] = "Post is created"
        redirect_to todos_path
    else
      render("index")
    end
  end

  def show
    set_todo
  end 
  
  def edit
    if Todo.exists?(params[:id])
    else
      flash[:alert] = "Post isn't found!"
      redirect_to todos_path
    end
  end 

  def update
    if  @todo.update(todo_params)
        flash[:notice] = "Post is updated"
        redirect_to todo_path(@todo)
    else
      render("edit")
    end
  end 

  def destroy
    if @todo.destroy
      flash[:notice] = "Post is Deleted"
      redirect_to todos_path
    else
      render("index")
    end
  end 

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end 
    def todo_params
      params.require(:todo).permit(:name, :description, :start_dt, :end_dt, :iscompleted)
    end
end 