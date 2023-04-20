class PostCommentsController < ApplicationController
  def create
    # コメント作成し、データベースに保存する
    post_image = PostImage.find(params[:post_image_id])
    # アソシエーションしたPostImageモデルの idを、post_image_idとして取得する
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end