class Souryou < ActiveHash::Base
  self.data = [
    { id: 0, souryou: '--' },
    { id: 1, souryou: '着払い(出品者負担)' },
    { id: 2, souryou: '送料込み(出品者負担)' }
  ]
  include ActiveHash::Associations
  has_many :items
 end