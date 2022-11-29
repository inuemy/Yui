class Customer < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :prefecture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :sex, presence: true
  validates :birthday, presence: true

  enum sex: { man: 0, woman: 1 }

  has_one_attached :profile_image

  def self.guest
  find_or_create_by!(email: 'aaa@aaa.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.password_confirmation = user.password
    user.last_name = 'ゲスト'
    user.first_name = 'ユーザー'
    user.last_name_kana = 'ゲスト'
    user.first_name_kana = 'ユーザー'
    user.nickname = 'ゲスト'
    user.sex = 0
    user.birthday = Date.today
    user.prefecture_id = 1
    user.is_deleted = false
   end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image
    end
end
