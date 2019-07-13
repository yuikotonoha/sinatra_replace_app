class Post < ApplicationRecord
  # postは1人のユーザーに所属する
  belongs_to :user
end
