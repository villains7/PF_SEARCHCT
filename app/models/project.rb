class Project < ApplicationRecord
  belongs_to :members
  has_many :comments, dependent: :destroy
  has_many :thanks, dependent: :destroy
  #タグ実装したら追加記載
end
