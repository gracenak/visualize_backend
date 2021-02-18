class Vision < ApplicationRecord
  belongs_to :theme
  validates :title, presence: true
end
