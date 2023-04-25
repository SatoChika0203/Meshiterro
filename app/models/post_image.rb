class PostImage < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  # belongs_to : 「〜に属する」アソシエーション
  #PostImage モデルから user_id に関連付けられていて、User モデルを参照することができる 
  # 1:N の「N」側にあたるモデルに、belongs_to を記載する
  # 1 つの User モデルに関連付けられるため、単数形の「user」にする
  
  has_many :post_comments, dependent: :destroy
  # PostCommentモデルを複数持つ 
  
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  # バリテーション：入力されたデータのpresence（存在）をチェック
  
  # 画像が存在しない場合に表示する画像をActiveStorageに格納する
  def get_image
    unless image.attached?
       file_path=Rails.root.join('app/assets/images/no_image.jpg')
       image.attach(io:File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image
  end
  # get_image ...メソッド（アクションではない）
  # PostImageモデル内に記載して、カラムを呼び出すように、このメソッドをよびだせる

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  # favorited_by?メソッドで、引数で渡されたユーザidがFavoritesテーブル内に
  # 存在（exists?）するかどうかを調べる
  end
end
