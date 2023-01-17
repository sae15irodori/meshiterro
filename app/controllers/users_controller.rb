class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])#特定IDユーザーのレコード取得
    @post_images = @user.post_images#そのﾕｰｻﾞｰの投稿全て取得
  end

  def edit#ユーザー情報の編集をする
    @user = User.find(params[:id])#特定IDユーザーのレコードを取得
  end

  def update
    @user = User.find(params[:id])#特定IDﾕｰｻﾞｰのﾚｺｰドを取得(editでﾌｫｰﾑに入力したﾃﾞｰﾀ)
    @user.update(user_params)#データの更新
    redirect_to user_path(@user.id)#詳細ﾍﾟｰｼﾞへﾘﾀﾞｲﾚｸﾄ(特定IDのページ)
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
