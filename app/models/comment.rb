class Comment < ApplicationRecord
  belongs_to :member_id
  belongs_to :project_id
end
