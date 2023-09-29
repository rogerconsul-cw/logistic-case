class FrontPageController < ApplicationController
  def front_page
  end

  def search
    if params[:type] == 'book'
      @books = Book.where('title LIKE ?', "%#{params[:query]}%")
      if @books.present?
        redirect_to book_url(@books.first)
        return
      end
    elsif params[:type] == 'author'
      @authors = Author.where('name LIKE ?', "%#{params[:query]}%")
      if @authors.present?
        redirect_to author_url(@authors.first)
        return
      end
    end
    render :front_page
  end
end
