class User < ActiveRecord::Base
  cattr_accessor :current_user

  validates_presence_of :password, :login, :name
  validates_uniqueness_of :login

  def password_correct?(passwd)
    self.password==passwd
  end

  def active?
    true
  end
end
