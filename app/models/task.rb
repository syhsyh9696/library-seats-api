class Task < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :seat, presence: true
end
