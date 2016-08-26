class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user
  validates :name, :description, presence: true
  validates :name, length: {minimum: 5}
  validates :description, length: {minimum: 10}, :on => :create

  def find_member_id current_user
    Membership.select(:id).where(user: current_user, organization: self)[0].id
  end
end
