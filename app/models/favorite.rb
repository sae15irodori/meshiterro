class Favorite < ApplicationRecord

  belongs_to :user#あんたユーザーと結ばれてるよ
  belongs_to :post_image#あんた投稿内容と結ばれてるよ
end
