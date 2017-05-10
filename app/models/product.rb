class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :relationships #建立user和product之间的多对多关系
  has_many :collectors, through: :relationships, source: :user #product可以找到是哪些user收藏了它

  has_many :goods_likes #建立product和user之间的多对多关系
  has_many :goods_voters, through: :goods_likes, source: :user #product可以知道是哪些user点赞了它

  has_many :goods_dislikes#建立product和user之间的多对多关系
  has_many :goods_antis, through: :goods_dislikes, source: :user#product可以知道是哪些user踩了它
end
