class Project < ApplicationRecord
  belongs_to :member
  has_many :comments, dependent: :destroy
  has_many :thanks, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, dependent: :destroy
  has_one_attached :project_image

  validates :customer, presence: true
  validates :title, presence: true
  validates :region, presence: true
  validates :salesman, presence: true
  validates :start_year, presence: true
  validates :start_month, presence: true
  validates :start_day, presence: true
  validates :end_year, presence: true
  validates :end_month, presence: true
  validates :end_day, presence: true
  validates :vehicle_type, presence: true
  validates :lease_type, presence: true
  validates :registration_number, presence: true
  validates :body_number, presence: true
  validates :body_shop, presence: true

  # 車種
  enum vehicle_type: { eleho: 0, fonerd: 1, gigu: 2, others: 3 }
  # リース種別
  enum lease_type: { fl: 0, ml: 1, mj: 2, sl: 3, smj: 4 }
  # 保険の有無
  enum insurance: { one: 0, nothing: 1 }

  def thanked_by?(member)
    thanks.exists?(member_id: member.id)
  end
end
