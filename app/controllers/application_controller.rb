class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  # バリテーション
  # :authenticate_user!：ログイン認証されていなければ、ログイン画面へリダイレクトする
  # except：トップページのみログイン状態に関わらず、アクセス可能
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_actionメソッド：コントローラーで各アクションを実行する前に実行したい処理を指定することができる
  
  def after_sign_in_path_for(resource)
    post_images_path
  # after_sign_in_path_for: Deviseが用意しているメソッドで、
  # サインイン後にどこに遷移するかを設定しているメソッド
  end
  
  def after_sign_out_path_for(resource)
    about_path
    # after_sign_out_path_for: Deviseが用意しているメソッドで
    # サインアウト後にどこに遷移するかを設定するメソッド
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # configure_permitted_parametersメソッド：devise_parameter_sanitizer.permitメソッドを使うことで
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可する
  # permit...保存を許可するカラムを指定します
  
  
  # deviseのコントローラは直接修正できないため、ApplicationControllerに記述する
end
