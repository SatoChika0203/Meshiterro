class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  # UserモデルもPostImageモデルも、PostCommentに関連付けられるのは1つだけ
  
end
