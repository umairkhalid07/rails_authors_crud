class AuthorsController < ApplicationController
  def home

  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    puts "===============Entered Delete Function==============="
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path, status: :see_other
    puts "===============Left Delete Function==============="
  end

  private
    def author_params
      params.require(:author).permit(:name, :description)
    end
end
