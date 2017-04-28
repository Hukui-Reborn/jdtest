class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders

  has_many :relationships #建立user和product之间的多对多关系
  has_many :collections, through: :relationships, source: :product #user可以它找到收藏的物品

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
    is_admin
  end

  #判断选中的product是否已经在收藏列表中
  def is_collector_of?(product)
    collections.include?(product)
  end

 #将选中的product加入收藏列表中
  def collect!(product)
    collections << product
  end

 #将选中的product从收藏列表中删除
  def  remove!(product)
    collections.delete(product)
  end


end
