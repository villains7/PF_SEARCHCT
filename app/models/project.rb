class Project < ApplicationRecord
  belongs_to :member
  has_many :comments, dependent: :destroy
  has_many :thanks, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, dependent: :destroy
  has_one_attached :project_image

  validates :title, presence: true
  validates :caption, presence: true
  validates :region, presence: true
  validates :salesman, presence: true

  def thanked_by?(member)
    thanks.exists?(member_id: member.id)
  end
end
