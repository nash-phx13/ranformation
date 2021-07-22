# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.seed(:id,
  { :id => 1, :tag_name => "ランニング" },
  { :id => 2, :tag_name => "練習方法" },
  { :id => 3, :tag_name => "大会の記録" },
  { :id => 4, :tag_name => "コース" },
  { :id => 5, :tag_name => "シューズ" },
  { :id => 6, :tag_name => "怪我の予防"},
)