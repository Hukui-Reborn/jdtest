class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :relationships #建立user和product之间的多对多关系
  has_many :collectors, through: :relationships, source: :user #product可以找到是哪些user收藏了它
end
