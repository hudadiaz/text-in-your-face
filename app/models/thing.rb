class Thing < ApplicationRecord
  MAX_LENGTH = 120
  validates :content,
            presence: true,
            uniqueness: true,
            length: { maximum: MAX_LENGTH }
end
