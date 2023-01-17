class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])#特定IDユーザーのレコード取得
    @post_images = @user.post_images#そのﾕｰｻﾞｰの投稿全て取得
  end

  def edit
  end


  private
  def post_image_params
    params.require(:user).permit(:email, :encrypted_password, :name)
  end
end
