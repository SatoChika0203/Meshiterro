class PostImage < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  # belongs_to : 「〜に属する」
  #PostImage モデルから user_id に関連付けられていて、User モデルを参照することができる 
  # 1:N の「N」側にあたるモデルに、belongs_to を記載する
  # 1 つの User モデルに関連付けられるため、単数形の「user」にする
end
