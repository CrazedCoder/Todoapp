class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def create

    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def show
    @todo_find = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :description)
  end

  def edit
    @todo_find = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Todo was updated successfully!"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

end