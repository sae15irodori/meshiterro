class PostComment < ApplicationRecord

  belongs_to :user#Userモデルとｱｿｼｴｰｼｮﾝ
  belongs_to :post_image#ＰostＩmageモデルとｱｿｼｴｰｼｮﾝ
end
