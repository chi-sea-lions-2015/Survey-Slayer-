class User < ActiveRecord::Base
  has_many :surveys, foreign_key: 'creator_id'
  has_many :taken_surveys, foreign_key: "participant_id"
  has_many :responses, through: :taken_surveys

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password ||= Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, pass)
    @user = User.find_by(email: email)
    return @user if @user && (@user.password == pass)
  end

end
