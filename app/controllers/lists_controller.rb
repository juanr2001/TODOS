class ListsController < ApplicationController
  def index #this is GET request, it will show all the posts
    @list = List.all
    render :index
  end

  def show #this is a GET Request, it will show and individual post
    @list = List.find(params [:id])
    render :show
  end

  def new#this is GET Request, it will display the form to summit a new post
    @list = List.new
    @action = lists_path
    @http_method = :post
    render :new
  end

  def create#this is POST request. It does not have a view, it just saves the post  in the data base, and it will rederect to a different page
    @list = List.create(title: params[:tittle],
                                  content: params[:content],
                                  due_day: params[:due_day],
                                  finished: params[:finished])
  rederect_to list_path

  end

  def edit #this is a GET request, it will display a form for editing a post
    @list = List.find(params[:id])
    @action = lists_path(@list)
    @http_method = :post

    render :edit
  end

  def update#this is PATCH request. It will update the post of the database. It does not have a view file, and rederect to a different page
    @list = List.find(params[:id])
    @list.update(title: params[:title],
                          content: params[:content],
                          due_day: params[:due_day],
                          finished: params[:finished])
    rederect_to list_path(@list)
  end

  def delete #this is DELETE request. It does not have a view file, it rederects to a different page.
    @list = List.find(params[:id])
    @list.destroy
  rederect_to lists_path
  end

end