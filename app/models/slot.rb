class Slot < ApplicationRecord
  validates :price, :programming_language, :start_date, :end_date, :start_time, :end_time, presence: true

  belongs_to :user
end
