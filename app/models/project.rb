class Project < ApplicationRecord
  belongs_to :member
  has_many :comments, dependent: :destroy
  has_many :thanks, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  has_one_attached :project_image
  #タグ実装したら追加記載

  validates :title, presence: true
  validates :caption, presence:true
  validates :region, presence:true
  validates :salesman, presence:true

  def thanked_by?(member)
    thanks.exists?(member_id: member.id)
  end
  #プロジェクトの検索のメソッド
  def self.search_for(keyword,content)
    if keyword.present? && content.present?
      Project.where('title LIKE ?', '%' + keyword + '%').where('salesman LIKE ?','%' + content + '%')
    elsif keyword.present? && content == ""
      Project.where('title LIKE ?', '%' + keyword + '%')
    elsif keyword == "" && content.present?
      Project.where('salesman LIKE ?','%' + content + '%')
    else
      Project.all
    end
  end

end
