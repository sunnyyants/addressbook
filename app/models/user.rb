class User < ActiveRecord::Base
  authenticates_with_sorcery!


  validates_presence_of :name, :password, :email, :phone

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "Wrong email format..."

  validates_uniqueness_of :name, :scope => [:email, :phone]
end
