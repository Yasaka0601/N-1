# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# ================================
#  第1世代ローマ字ポケモン（60匹）
# ================================
POKEMON_ROMAJI = %w[
  fushigidane fushigisou fushigibana hitokage lizardo lizadonn zenigame kameru kamekkusu
  caterpie toranseru butterfree beedle cocoon spear nidoran_f nidolina nidokuin
  nidran_m nidrino nidoking pikachu raichu sand shrew sandslash nidoran clefairy clefable vulpix ninetales
  jigglypuff wigglytuff zubat golbat oddish gloom vileplume paras parasect venonat venomoth diglett dugtrio
  meowth persian psyduck golduck mankey primeape growlithe arcanine poliwag poliwhirl poliwrath abra kadabra alakazam
  machop machoke machamp bellsprout weepinbell victreebel tentacool tentacruel geodude graveler golem
]

# ================================
#  トレーナー配列（10人）
# ================================
TRAINER_NAMES = [
  "satoshi", "red", "green", "blue", "kasumi",
  "takeshi", "shigeru", "hibiki", "haruka", "shirona"
]

puts "🧹 データをリセット中..."
Pokemon.delete_all
Trainer.delete_all

puts "👤 トレーナーとポケモンを作成中..."

TRAINER_NAMES.each do |name|
  trainer = Trainer.create!(
    email: "#{name}@example.com",
    password: "password"
  )

  # 各トレーナーに6匹（重複なし）
  POKEMON_ROMAJI.sample(6).each do |pokemon_name|
    Pokemon.create!(
      name: pokemon_name,
      trainer: trainer
    )
  end
end

puts "✅ シードデータの作成が完了しました！"
puts "（合計 #{Trainer.count} 人のトレーナー、#{Pokemon.count} 匹のポケモン）"