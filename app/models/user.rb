class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy#post_imagesﾓﾃﾞﾙとｱｿｼｴｰｼｮﾝ
  has_many :post_comments, dependent: :destroy#コメントﾓﾃﾞﾙとｱｿｼｴｰｼｮﾝ
  has_many :favorites, dependent: :destroy#いいねﾓﾃﾞﾙとｱｿｼｴｰｼｮﾝ


  has_one_attached :profile_image#profile_imageという名前でｱｸﾃｨﾌﾞｽﾄﾚｰｼﾞでﾌﾟﾛﾌｨﾙ画像保存できる


  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed#画像サイズの変更できる
  end

end
