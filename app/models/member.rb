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



  REGION = [["本社","1"],["近畿","2"],["中部","3"],["東北","4"],["中国四国","5"],["九州","6"],["北海道","7"]]
  SECTION = [["営業部","営業部"],["業務部","業務部"],["経理部","経理部"]]

  def get_profile_image(weight,height)
    (profile_image.attached) ? profile_image : 'noimage.jpg'
  end
end
