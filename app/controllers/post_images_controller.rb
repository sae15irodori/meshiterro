class PostImagesController < ApplicationController
  def new#投稿フォーム
    @post_image = PostImage.new
  end
  
  def create#保存(登録)機能
    @post_image = PostImage.new(post_image_params)#ﾌｫﾑに入力したﾃﾞｰﾀ(ﾊﾟﾗﾒｰﾀで指定した)を取得
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_image_path#一覧ぺーしに飛ぶ
  end

  def index
  end

  def show
  end
  
  private
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
