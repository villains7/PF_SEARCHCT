class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :thanks, dependent: :destroy
  has_many :thanks_project,through: :thanks,source: :project
  has_one_attached :profile_image

  REGION = [["本社",1],["近畿",2],["中部",3],["東北",4],["中国四国",5],["九州",6],["北海道",7]]
end
