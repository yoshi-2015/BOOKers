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
    # if文でエラー吐いた時の対応を記述
    flash[:notice] = "登録完了しました！Book was successfully created."
    # rails routesで調べるとshowがbookとなっていた
    # 更に登録したデータを保存するのはbook.saveのため、引数もbookでOK
    redirect_to book_path(book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    # if文でエラー吐いた時の対応を記述
    flash[:notice] = "編集完了しました！Book was successfully updated."
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    # if文でエラー吐いた時の対応を記述
    flash[:notice] = "削除完了しました！Book was successfully destroyed."
    redirect_to books_path
  end

  private
    def book_params
    params.require(:book).permit(:title, :body)
  end
end
