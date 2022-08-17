class TodosController < ApplicationController
  before_action :require_user
  before_action :set_todo, only: [:edit, :update, :show, :destroy]
  before_action :set_user, only: [:create, :edit, :update, :destroy]

  def index
    # debugger
    if !isadmin?
      @todos = @current_user.todos
    else
      @todos = Todo.all
    end
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = @current_user.id
    if  @todo.save
        flash[:notice] = "Post is created"
        redirect_to todo_path(@todo)
    else
      render "index"
    end
  end

  def show
    @read_only = true
    set_todo
  end

  def edit
    if Todo.exists?(params[:id])
      @read_only = false
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
      render "edit"
    end
  end

  def destroy
    if @todo.destroy
      flash[:notice] = "Post is Deleted"
      redirect_to todos_path
    else
      render "index"
    end
  end

  def complete
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_param)
      flash[:success] = 'Recipe updated successfully'
      # redirect_to recipes_path
    end
  end

  private

    def set_user
      if session[:user_id]
        @user = User.find_by(id: session[:user_id])
      end
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
    def todo_params
      params.require(:todo).permit(:name, :description, :start_dt, :end_dt, :iscompleted)
    end
end
