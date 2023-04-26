class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
# before_actionメソッド：コントローラーで各アクションを実行する前に実行したい処理を指定することができる
  
  def show
    @user=User.find(params[:id])
    # idに関連付けられているUserモデルのレコード全てを取得する
    @post_images = @user.post_images.page(params[:page])
    # 特定のユーザ（@user）に関連付けられた投稿を、決められた分だけ（.post_images）を取得
    # @post_imagesに渡す という処理を行う
  end

  def edit 
    @user=User.find(params[:id])
    # 「params[:id]」：URLに含まれる:idを取得できる
  end
  
  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
end

