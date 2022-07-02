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
        flash[:notice] = "Post is created"
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
      flash[:alert] = "Post isn't found!"
      redirect_to todos_path
    end
  end 

  def update
    @todo = Todo.find(params[:id])
    if  @todo.update(todo_params)
        flash[:notice] = "Post is updated"
        redirect_to todo_path(@todo)
    else
      render("edit")
    end
  end 

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:notice] = "Post is Deleted"
      redirect_to todos_path
  else
    render("index")
  end
  end 

  private
    def todo_params
      params.require(:todo).permit(:name, :description, :start_dt, :end_dt, :iscompleted)
    end
end 