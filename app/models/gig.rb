class Gig < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  validates :name, :description, presence: true
  validates :name, :description, length: { minimum: 3 }
  validates :user_id, uniqueness: { scope: :slot_id }
end
