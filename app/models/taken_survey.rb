class TakenSurvey < ActiveRecord::Base
  belongs_to :participant, class_name: "User"
  belongs_to :survey
  has_many :responses
end
