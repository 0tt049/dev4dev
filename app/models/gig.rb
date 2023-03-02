class Gig < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  validades :name, :description, presence: true
  validates :name, :description, length: { minimum: 3 }
  validades :user_id, uniqueness: { scope: :slot_id }

end
