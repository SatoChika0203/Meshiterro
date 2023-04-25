class Favorite < ApplicationRecord
  # Favoriteモデルのカラム（user_idとpost_image_id）は、UserモデルのidやPostImageモデルのidと関連付ける
  # いいね機能は１：NのN側
  belongs_to :user
  belongs_to :post_image
end
