class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 def unavailable_dates
  slots.pluck(:start_date, :end_date).map do |range|
   { from: range[0], to: range[1] }
   end
end
end
