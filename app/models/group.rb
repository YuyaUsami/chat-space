class Group < ApplicationRecord
  has_many :users , through: :group_users
  has_many :groups_users
  has_many :messages
end