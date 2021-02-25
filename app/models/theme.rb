class Theme < ApplicationRecord
    has_many :visions, dependent: :destroy
end
