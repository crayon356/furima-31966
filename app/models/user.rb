class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, uniqueness: { case_sensitive: true }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶーー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶーー]+\z/ }
  validates :birthday, presence: true
end
