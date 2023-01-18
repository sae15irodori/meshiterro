class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user#userモデルとｱｿｼｴｰｼｮﾝ
  has_many :post_comments, dependent: :destroy#ｺﾒﾝﾄﾓﾃﾞﾙﾙとｱｿｼｴｰｼｮﾝ
  has_many :favorites, dependent: :destroy#いいねﾓﾃﾞﾙとｱｿｼｴｰｼｮﾝ

  validates :shop_name, presence: true#shop_nameが存在しているかを確認しているﾊﾞﾘﾃﾞｰｼｮﾝ
  validates :image, presence: true#imageが存在するか確認している　ﾊﾞﾘﾃﾞｰｼｮﾝ




  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

