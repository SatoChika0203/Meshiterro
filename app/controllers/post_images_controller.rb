class PostImagesController < ApplicationController
  def new
    # 画像投稿の画面を表示する
    @post_image=PostImage.new
  end

  def create
    # 投稿データを保存する
    @post_image=PostImage.new(post_image_params)
    # post_image_params : フォームで入力されたデータが、投稿データとして許可されているパラメータかどうかをチェック
    # フォームに入力されたデータが、インスタンス変数に格納される
    @post_image.user_id=current_user.id
    # user_idは、画像投稿を行う際に、投稿したユーザーをユーザーの ID で判断する
    # @post_image.user_id: PostImage モデルに紐づくカラムの値を取得したり、逆に値を代入することができる
    # current_user : ログイン中のユーザー情報を取得することができる
    # @post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に
    # 指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる
    
    if @post_image.save
      redirect_to post_images_path
      # もし対象のカラムにデータが保存されたら、投稿一覧画面へリダイレクト
    else
      render :new
    end
  end

  def index
    # タイムライン上に表示する全ての画像を取得する
    # @post_images=PostImage.all
    
     @post_images = PostImage.page(params[:page])
    # 1ページ分の決められた数のデータだけを、新しい順に取得する
    # pageメソッド:kaminariをインストールしたことで使用可能になったメソッド
  end

  def show
    # 詳細画面
    @post_image=PostImage.find(params[:id])
    # コメントを投稿する
    @post_comment=PostComment.new
  end
  
  def destroy
    post_image=PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
    # 投稿の削除後は一覧画面に遷移
  end

  # 投稿データのストロングパラメータ
  private
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
