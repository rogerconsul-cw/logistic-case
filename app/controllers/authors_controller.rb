class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]

  # GET /authors or /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(name: params[:author][:name].strip)
    
    if @author.save
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render :new
    end
  end
  
  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    new_name = params[:author][:name].strip
    existing_author = Author.find_by(name: new_name)
  
    if existing_author && existing_author.id != @author.id
      redirect_to @author, notice: 'Author already exists'
    else
      if @author.update(name: new_name)
        redirect_to @author, notice: 'Author was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    if @author.books.exists?
      redirect_to authors_url, notice: "Author cannot be deleted because they are associated with one or more books. Remove the books first."
    else
      @author.destroy
      redirect_to authors_url, notice: "Author was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:name)
    end
end
