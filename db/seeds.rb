# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
  { body: '完成度' },
  { body: '将来性' },
  { body: '球威型' },
  { body: '制球型' },
  { body: '変化球型' },
  { body: 'スタミナ型' },
  { body: '本格派' },
  { body: '技巧派' },
  { body: '変則派' },
  { body: '精密機械' },
  { body: '鉄腕' },
  { body: '安定感' },
  { body: 'ドクターＫ' },
  { body: '強心臓' },
  { body: 'クロスファイア' },
  { body: '暴れ玉' },
  { body: 'ノビ' },
  { body: 'キレ' },
  { body: 'ミート型' },
  { body: 'パワー型' },
  { body: '守備型' },
  { body: '走塁型' },
  { body: '安打製造機' },
  { body: '長距離砲' },
  { body: '韋駄天' },
  { body: '守備職人' },
  { body: 'プルヒッター' },
  { body: '流し打ち' },
  { body: '粘り打ち' },
  { body: '広角砲' },
  { body: '鉄人' },
  { body: 'ハイボールヒッター' },
  { body: 'ローボールヒッター' },
  { body: 'チャンス' },
  { body: '選球眼' },
  { body: 'フルスイング' },
  { body: 'ラインドライブ' },
])

Mptag.create([
  { main_p_position: '先発' },
  { main_p_position: '中継ぎ' },
  { main_p_position: '抑え' }
])

Mfctag.create([
  { main_fc_position: '捕手' },
])

Mfitag.create([
  { main_fi_position: '一塁手' },
  { main_fi_position: '二塁手' },
  { main_fi_position: '三塁手' },
  { main_fi_position: '遊撃手' }
])

Mfotag.create([
  { main_fo_position: '左翼手' },
  { main_fo_position: '中堅手' },
  { main_fo_position: '右翼手' },
  { main_fo_position: '指名打者' }
])

Sptag.create([
  { sub_p_position: '先発' },
  { sub_p_position: '中継ぎ' },
  { sub_p_position: '抑え' }
])

Sfctag.create([
  { sub_fc_position: '捕手' },
])

Sfitag.create([
  { sub_fi_position: '一塁手' },
  { sub_fi_position: '二塁手' },
  { sub_fi_position: '三塁手' },
  { sub_fi_position: '遊撃手' }
])

Sfotag.create([
  { sub_fo_position: '左翼手' },
  { sub_fo_position: '中堅手' },
  { sub_fo_position: '右翼手' },
  { sub_fo_position: '指名打者' }
])

Wptag.create([
  { whole_p_position: '先発' },
  { whole_p_position: '中継ぎ' },
  { whole_p_position: '抑え' }
])

Wfctag.create([
  { whole_fc_position: '捕手' },
])

Wfitag.create([
  { whole_fi_position: '一塁手' },
  { whole_fi_position: '二塁手' },
  { whole_fi_position: '三塁手' },
  { whole_fi_position: '遊撃手' }
])

Wfotag.create([
  { whole_fo_position: '左翼手' },
  { whole_fo_position: '中堅手' },
  { whole_fo_position: '右翼手' },
  { whole_fo_position: '指名打者' }
])

Etag.create([
  { expectation: '1位' },
  { expectation: '2位' },
  { expectation: '3位' },
  { expectation: '4位' },
  { expectation: '5位' },
  { expectation: '6位' },
  { expectation: '7位~' },
  { expectation: '育成' },
  { expectation: '漏れ' }
])

Vtag.create([
  { variety: 'スライダー' },
  { variety: 'カットボール' },
  { variety: 'カーブ' },
  { variety: 'フォーク' },
  { variety: 'スプリット' },
  { variety: 'チェンジアップ' },
  { variety: 'シンカー' },
  { variety: 'シュート' },
  { variety: 'ツーシーム' }
])

Vltag.create([
  { variety: 'スライダー' },
  { variety: 'カットボール' }
])

Vlltag.create([
  { variety: 'カーブ' }
])

Vutag.create([
  { variety: 'フォーク' },
  { variety: 'スプリット' },
  { variety: 'チェンジアップ' }
])

Vlrtag.create([
  { variety: 'シンカー' }
])

Vrtag.create([
  { variety: 'シュート' },
  { variety: 'ツーシーム' }
])




