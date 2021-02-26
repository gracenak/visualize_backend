class Vision < ApplicationRecord
  belongs_to :theme
  scope :order_by_created_at, ->{order("created_at DESC")}
end
