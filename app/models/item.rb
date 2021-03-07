class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :state
    belongs_to :province
    belongs_to :souryou
    belongs_to :day
  
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :state_id
    validates :province_id
    validates :souryou_id
    validates :day_id
  end 

  with_options presence: true do
    validates :name
    validates :category_id
    validates :state_id
    validates :province_id
    validates :souryou_id
    validates :day_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :comment
    validates :image
    validates :user
  end

  belongs_to :user
  has_one :buyer
  has_one_attached :image
end
