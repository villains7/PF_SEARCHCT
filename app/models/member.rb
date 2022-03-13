class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :thanks, dependent: :destroy
  has_many :thanks_projects, through: :thanks,source: :project
  has_many :view_counts, dependent: :destroy
  has_one_attached :profile_image

  validates :last_name,presence: true
  validates :first_name,presence: true

# 　hash = ({id:1, region:"本社"},{id:2,region:"近畿"},{id:3,region:"中部"},{id:4,region:"東北"},{id:5,region:"中国四国"},{id:6,region:"九週"},{id:7,region:"北海道"})

  REGION = [["本社","本社"],["近畿","近畿"],["中部","中部"],["東北","東北"],["中国四国","中国四国"],["九州","九週"],["北海道","北海道"]]
  SECTION = [["営業部","営業部"],["業務部","業務部"],["経理部","経理部"]]

  def get_profile_image(weight,height)
    (profile_image.attached) ? profile_image : 'noimage.jpg'
  end
end
