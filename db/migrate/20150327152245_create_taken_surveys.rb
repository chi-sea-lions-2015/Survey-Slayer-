class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.belongs_to :participant
      t.belongs_to :survey
    end
  end
end
