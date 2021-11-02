class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  rolify

  extend FriendlyId
  friendly_id :email, use: :slugged

  after_create :assign_default_role
  #make sure that each user on the system has at least one roll
  validate :must_have_a_role, on: :update
  has_many :projects

  def to_s
    username
  end

  def username
    self.email.split(/@/).first
  end


  def online?
    updated_at > 2.minutes.ago
  end

  def assign_default_role
    # If first User of the system, he will be an admin, otherwise he will be a teacher and a studnet
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:client)
    else
    self.add_role(:client) if self.roles.blank?
    end
  end

  private
  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "Must have at least one role")
    end
  end
  
end
