class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :friendships
  has_many :friends, :through => :friendships

  validates_presence_of :name, :password, :email, :phone , on: :create

  validates_presence_of :name, :email, :phone, on: :update

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "Wrong email format..."

  validates_uniqueness_of :email ,:phone

end
