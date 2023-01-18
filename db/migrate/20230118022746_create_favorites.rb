class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id#いいねしたユーザーのID
      t.integer :post_image_id#いいねされた投稿画像のID

      t.timestamps
    end
  end
end
