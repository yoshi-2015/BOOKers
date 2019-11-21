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
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "登録完了しました！Book was successfully created."
      redirect_to book_path(@book)
    else
      # ここに@book = Book.newを入れてしまうと、
      # せっかくエラーが出ているのに上書きしてしまうため記述しない！
      # 全件取得して欲しい情報だけ入れてあげる
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "編集完了しました！Book was successfully updated."
      render :show
    else
      render :edit
    end
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




