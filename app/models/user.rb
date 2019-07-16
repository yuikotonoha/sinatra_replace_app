class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # userはたくさんのitemを持っている
  has_many :posts
  # userはたくさんのcommentを持っている
  has_many :comments

  # 画像アップロード機能
  mount_uploader :image, ImageUploader

  # 登録時のバリデーション
  validates :nickname, presence: true
  validates :image, presence: true
end
