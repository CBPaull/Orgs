class User < ActiveRecord::Base
	has_secure_password
	has_many :organizations
	has_many :memberships
	has_many :joined_orgs, through: :memberships, source: :organization
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  	validates :first_name, :last_name, :email, :password, presence: true, :on => :create
 	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
