class Book < ApplicationRecord
  # 入力された値が空の場合エラー扱いになる
  validates :title, presence: true
  validates :body, presence: true
end
