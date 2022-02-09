class Movie < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates_presence_of :title, :description, :user
end
