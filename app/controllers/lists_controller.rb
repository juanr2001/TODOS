class ListsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :update, :delete]
  before_action :strong_params_lists, only: [:create, :update]
  before_action :set_list, only: [:show, :edit, :update, :destroy, :todos_featured, :finished_yes_no]

  def all_user_todos

  end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
  end

  def create
    @list = List.new. strong_params_lists
    if @list.save
      redirect_to @list, notice: "Successfully created!"
    end
    render :new
  end

  def edit
  end

  def update
    if @list.update
      redirect_to root_path, notice: "Successfully Created!"
    end
    # render :show
  end

  def destroy
    @list.destroy
  end

  def finished_yes_no
    @list.toggle!(:finished)
    flash[:notice] = "You are #{@list.finished}"
    redirect_to @list
  end



  private


  def strong_params_lists
    params.require(:list).permit(:title,:content,:due_day, :finished)
  end

  def set_list
    @list = List.find(params[:id])
  end
end