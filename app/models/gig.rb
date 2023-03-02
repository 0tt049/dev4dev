class Gig < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  validades :name, :description, presence: true
  validates :name, length: { minimum: 3 }
end
