class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]="Book Created Successfully"
      redirect_to author_path(@book.author.id)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @author = Author.find(@book.author.id)
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to author_path(@book.author.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    puts "===============Entered Delete Function==============="
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to authors_path
    puts "===============Left Delete Function==============="
  end

  private
    def book_params
      params.require(:book).permit(:name, :description, :author_id)
    end
end
