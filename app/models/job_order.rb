class JobOrder < ApplicationRecord
    validates :department, presence: true, length: { maximum: 40 }
    validates :description, presence: true
end
