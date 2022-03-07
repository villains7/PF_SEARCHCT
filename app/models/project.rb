class Project < ApplicationRecord
  belongs_to :member
  has_many :comments, dependent: :destroy
  has_many :thanks, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  has_one_attached :project_image
  #タグ実装したら追加記載

  def thanked_by?(member)
    thanks.exists?(member_id: member.id)
  end

  def self.search_for(content)  #プロジェクトの検索のメソッド
   if content
     Project.where('title LIKE ?', '%' + content + '%').or(Project.where('salesman LIKE ?','%' + content + '%'))
   else
     Project.all
   end
  end

end
