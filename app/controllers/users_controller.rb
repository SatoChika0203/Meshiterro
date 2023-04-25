class UsersController < ApplicationController
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
end
