# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ prefecture_name: 'Star Wars' }, { prefecture_name: 'Lord of the Rings' }])
#   Character.create(prefecture_name: 'Luke', movie: movies.first)

# Customer.create!(
#    email: "mayu0426@gmail.com",
#    password: "mayu0426",
#    id: 1,
#    last_prefecture_name: "井上",
#    first_prefecture_name: "茉優",
#    last_prefecture_name_kana: "イノウエ",
#    first_prefecture_name_kana: "マユ",
#    nickprefecture_name: "まゆ",
#    sex: "女性",
#    birthday: 19980426,
#    prefectures: "福岡県",
#    is_deleted: "true",
# )

# Admin.create!(
#    email: "mayu0426sk62@icloud.com",
#    password: "mayu0426"
# )

admins = [
  {email: 'mayu0426sk62@icloud.com', password: 'mayu0426'},
]

admins.each do |admin|
  admin_data = Admin.find_by(email: admin[:email])
  if admin_data.nil?
    Admin.create(email: admin[:email], password: admin[:password])
  end
end


Prefecture.find_or_create_by(prefecture_name: '北海道', slug: 'hokkaido')
Prefecture.find_or_create_by(prefecture_name: '青森県', slug: 'aomori')
Prefecture.find_or_create_by(prefecture_name: '秋田県', slug: 'akita')
Prefecture.find_or_create_by(prefecture_name: '岩手県', slug: 'iwate')
Prefecture.find_or_create_by(prefecture_name: '宮城県', slug: 'miyagi')
Prefecture.find_or_create_by(prefecture_name: '山形県', slug: 'yamagata')
Prefecture.find_or_create_by(prefecture_name: '福島県', slug: 'fukushima')
Prefecture.find_or_create_by(prefecture_name: '栃木県', slug: 'tochigi')
Prefecture.find_or_create_by(prefecture_name: '茨城県', slug: 'ibaraki')
Prefecture.find_or_create_by(prefecture_name: '群馬県', slug: 'gunma')
Prefecture.find_or_create_by(prefecture_name: '埼玉県', slug: 'saitama')
Prefecture.find_or_create_by(prefecture_name: '千葉県', slug: 'chiba')
Prefecture.find_or_create_by(prefecture_name: '東京都', slug: 'tokyo')
Prefecture.find_or_create_by(prefecture_name: '神奈川県', slug: 'kanagawa')
Prefecture.find_or_create_by(prefecture_name: '新潟県', slug: 'nigata')
Prefecture.find_or_create_by(prefecture_name: '富山県', slug: 'toyama')
Prefecture.find_or_create_by(prefecture_name: '石川県', slug: 'ishikawa')
Prefecture.find_or_create_by(prefecture_name: '福井県', slug: 'fukui')
Prefecture.find_or_create_by(prefecture_name: '山梨県', slug: 'yamanashi')
Prefecture.find_or_create_by(prefecture_name: '長野県', slug: 'nagano')
Prefecture.find_or_create_by(prefecture_name: '岐阜県', slug: 'gifu')
Prefecture.find_or_create_by(prefecture_name: '静岡県', slug: 'shizuoka')
Prefecture.find_or_create_by(prefecture_name: '愛知県', slug: 'aichi')
Prefecture.find_or_create_by(prefecture_name: '三重県', slug: 'mie')
Prefecture.find_or_create_by(prefecture_name: '滋賀県', slug: 'shiga')
Prefecture.find_or_create_by(prefecture_name: '京都府', slug: 'kyoto')
Prefecture.find_or_create_by(prefecture_name: '大阪府', slug: 'osaka')
Prefecture.find_or_create_by(prefecture_name: '兵庫県', slug: 'hyougo')
Prefecture.find_or_create_by(prefecture_name: '奈良県', slug: 'nara')
Prefecture.find_or_create_by(prefecture_name: '和歌山県', slug: 'wakayama')
Prefecture.find_or_create_by(prefecture_name: '鳥取県', slug: 'tottori')
Prefecture.find_or_create_by(prefecture_name: '島根県', slug: 'simane')
Prefecture.find_or_create_by(prefecture_name: '岡山県', slug: 'okayama')
Prefecture.find_or_create_by(prefecture_name: '広島県', slug: 'hiroshima')
Prefecture.find_or_create_by(prefecture_name: '山口県', slug: 'yamaguchi')
Prefecture.find_or_create_by(prefecture_name: '徳島県', slug: 'tokushima')
Prefecture.find_or_create_by(prefecture_name: '香川県', slug: 'kagawa')
Prefecture.find_or_create_by(prefecture_name: '愛媛県', slug: 'ehime')
Prefecture.find_or_create_by(prefecture_name: '高知県', slug: 'kouchi')
Prefecture.find_or_create_by(prefecture_name: '福岡県', slug: 'fukuoka')
Prefecture.find_or_create_by(prefecture_name: '佐賀県', slug: 'saga')
Prefecture.find_or_create_by(prefecture_name: '長崎県', slug: 'nagasaki')
Prefecture.find_or_create_by(prefecture_name: '熊本県', slug: 'kumamoto')
Prefecture.find_or_create_by(prefecture_name: '大分県', slug: 'oita')
Prefecture.find_or_create_by(prefecture_name: '宮崎県', slug: 'miyazaki')
Prefecture.find_or_create_by(prefecture_name: '鹿児島県', slug: 'kagoshima')
Prefecture.find_or_create_by(prefecture_name: '沖縄県', slug: 'okinawa')

# prefectures = [
#   {prefecture_name: '北海道', slug: 'hokkaido'},
#   {prefecture_name: '青森県', slug: 'aomori'},
# ]

# prefectures.each do |prefecture|
#   Prefecture.find_or_create_by(prefecture_name: prefecture[:prefecture_name], slug: prefecture[:slug])
# end