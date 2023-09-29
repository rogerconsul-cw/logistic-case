class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  def search
    @books = Book.where('title LIKE ?', "%#{params[:query]}%")
  end
  # POST /books or /books.json
  # app/controllers/books_controller.rb

  def create
    author_name = params[:book].delete(:author_name)&.strip
    author = Author.find_or_create_by!(name: author_name)
    @book = Book.new(book_params.merge(author_id: author.id))

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end
  
  def update
    author_name = params[:book].delete(:author_name)&.strip
    author = Author.find_or_create_by!(name: author_name)
    
    if @book.update(book_params.merge(author_id: author.id))
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  private

    def book_params
      params.require(:book).permit(:title, :pages, :image_link, :author_id, :year, :author_name)
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

end
