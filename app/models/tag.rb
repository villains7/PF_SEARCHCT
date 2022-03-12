class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :projects, dependent: :destroy
end
