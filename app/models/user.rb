class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# deviseを利用したユーザーテーブルの作成
# deviceとは、ユーザー認証機能を有したGem(パッケージ）
# 作成した User モデルに devise で使用する機能が記述されている        

# :database_authenticatable（パスワードの正確性を検証）
# :registerable（ユーザ登録や編集、削除）
# :recoverable（パスワードをリセット）
# :rememberable（ログイン情報を保存）
# :validatable（email のフォーマットなどのバリデーション）

  has_many :post_images, dependent: :destroy 
# has_many : 「post＿imagesをたくさん持っている」
# 「１：Nの関係」の１側のモデルに記載する
# dependent: :destroy : 1:Nの1側が削除されたとき、N側を全て削除する
#   依存    :  削除

end
