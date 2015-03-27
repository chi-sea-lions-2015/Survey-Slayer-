class Response < ActiveRecord::Base
  belongs_to :taken_survey
  belongs_to :choice

end
