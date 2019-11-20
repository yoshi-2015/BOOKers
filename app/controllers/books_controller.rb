class BooksController < ApplicationController
  def top
  end

  def index
    # 空のモデル
    @book = Book.new
    # 全件取得して欲しい
    @books = Book.all
  end
  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def show
  end

  def edit
  end

  private
    def book_params
    params.require(:book).permit(:title, :body)
  end
end
