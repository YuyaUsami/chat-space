class Group < ApplicationRecord
  has_many :users , through: :groups_users
  has_many :groups_users

  validates_presence_of :name
end
