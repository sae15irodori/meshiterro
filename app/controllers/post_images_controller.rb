class PostImagesController < ApplicationController
  def new#投稿フォーム
    @post_image = PostImage.new
  end
  
  def create#保存(登録)機能
    @post_image = PostImage.new(post_image_params)#ﾌｫﾑに入力したﾃﾞｰﾀ(ﾊﾟﾗﾒｰﾀで指定した)を取得
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path#一覧ぺーしに飛ぶ
  end

  def index
    @post_images = PostImage.all#モデルの全てのレコードを取得
  end

  def show
    @post_image = PostImage.find(params[:id])#特定IDのデータを取得
    @post_comment = PostComment.new#ｺﾒﾝﾄﾓﾃﾞﾙもとに入力フォーム
  end
  
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path#一覧ページに飛ぶ
  end
  
  private
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
