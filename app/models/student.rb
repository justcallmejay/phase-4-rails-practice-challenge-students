class Student < ApplicationRecord
  belongs_to :instructor, dependent: :destroy

  validates :name, presence: true
  validates :age, numerality => {greater_than_or_equal: 18}
end
