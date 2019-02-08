class User < ApplicationRecord
  validates :userName, presence: true, length: {minumum: 3, maximum: 25}, uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sesitive: false}, format: {with: VALID_EMAIL_REGEX}
end
