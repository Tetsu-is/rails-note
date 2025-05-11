# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Note.create!([
  { title: 'はじめてのノート', body: 'これは最初のノートです。自由に編集できます。' },
  { title: 'Railsメモ', body: 'Railsでアプリを作るときのメモを書きましょう。' },
  { title: 'やることリスト', body: "・牛乳を買う\n・メールを返信する\n・運動する" }
])
