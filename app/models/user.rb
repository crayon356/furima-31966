class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/ } do
      validates :family_name
      validates :first_name
    end
    
    with_options format: { with: /\A[ァ-ヶーー]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end
    
    validates :birthday
  end
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX }
end

