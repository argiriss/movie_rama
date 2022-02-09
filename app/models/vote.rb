class Vote < ApplicationRecord
  enum vote_type: [ :like, :hate ]
  belongs_to :movie
  belongs_to :user
  validates_presence_of :vote_type
end
