class PostCommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image.id)#詳細画面へリダイレクト
  end

  def destroy
    PostComment.find(params[:id]).destroy#モデルからコメントを探して削除
    redirect_to post_image_path(params[:post_image_id])#詳細画面へリダイレクト
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
