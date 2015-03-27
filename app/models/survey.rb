class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :taken_surveys
  has_many :participants, through: :taken_surveys, source: :user

end
