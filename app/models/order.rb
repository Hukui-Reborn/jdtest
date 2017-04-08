class Order < ApplicationRecord
  belongs_to :user
  validates :billing_name, present: true
  validates :billing_address, present: true
  validates :shipping_name, present: true
  validates :shipping_address, present: true
end
