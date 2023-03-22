class Task < ApplicationRecord
    belongs_to :category
    validates :task, presence: true,
                     uniqueness: true
    validates :quadrant, presence: true
end
