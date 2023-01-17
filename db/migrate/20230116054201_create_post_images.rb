class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.string :shop_name#お店の名前を保存する
      t.text :caption#画像の説明文を保存する
      t.integer :user_id#投稿したﾕｰｻﾞｰ(主キー)の識別IDを保存する
      t.timestamps
    end
  end
end