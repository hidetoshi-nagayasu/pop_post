class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
end
