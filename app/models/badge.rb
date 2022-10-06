class Badge < ApplicationRecord
  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements

  validates :title, presence: true
  validates :img, presence: true

  enum rule: {
    no_rule: 0,
    first_attempt_success: 1,
    all_by_category: 2,
    all_by_level: 3
  }

end
