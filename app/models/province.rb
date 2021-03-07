class Province < ActiveHash::Base
  self.data = [
    { id: 0, province: '--' },
    { id: 1, province: '北海道' },
    { id: 2, province: '青森県' },
    { id: 3, province: '岩手県' },
    { id: 4, province: '宮城県' },
    { id: 5, province: '秋田県' },
    { id: 6, province: '山形県' },
    { id: 7, province: '福島県' },
    { id: 8, province: '茨城県' },
    { id: 9, province: '栃木県' },
    { id: 10, province: '群馬県' },
    { id: 11, province: '埼玉県' },
    { id: 12, province: '千葉県' },
    { id: 13, province: '東京都' },
    { id: 14, province: '神奈川県' },
    { id: 15, province: '新潟県' },
    { id: 16, province: '富山県' },
    { id: 17, province: '石川県' },
    { id: 18, province: '福井県' },
    { id: 19, province: '山梨県' },
    { id: 20, province: '長野県' },
    { id: 21, province: '岐阜県' },
    { id: 22, province: '静岡県' },
    { id: 23, province: '愛知県' },
    { id: 24, province: '三重県' },
    { id: 25, province: '滋賀県' },
    { id: 26, province: '京都府' },
    { id: 27, province: '大阪府' },
    { id: 28, province: '兵庫県' },
    { id: 29, province: '奈良県' },
    { id: 30, province: '和歌山県' },
    { id: 31, province: '鳥取県' },
    { id: 32, province: '島根県' },
    { id: 33, province: '岡山県' },
    { id: 34, province: '広島県' },
    { id: 35, province: '山口県' },
    { id: 36, province: '徳島県' },
    { id: 37, province: '香川県' },
    { id: 38, province: '愛媛県' },
    { id: 39, province: '高知県' },
    { id: 40, province: '福岡県' },
    { id: 41, province: '佐賀県' },
    { id: 42, province: '長崎県' },
    { id: 43, province: '熊本県' },
    { id: 44, province: '大分県' },
    { id: 45, province: '宮崎県' },
    { id: 46, province: '鹿児島県' },
    { id: 47, province: '沖縄県' }
  ]
  include ActiveHash::Associations
  has_many :items
 end