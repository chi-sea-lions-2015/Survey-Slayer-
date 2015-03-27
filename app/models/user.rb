class User < ActiveRecord::Base
  has_many :surveys, foreign_key: 'creator_id'
  has_many :taken_surveys, foreign_key: "participant_id"
  has_many :responses, through: :taken_surveys
end
