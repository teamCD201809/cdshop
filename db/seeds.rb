# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create(status_name: '意識')
Status.create(status_name: 'エネルギー')
Status.create(status_name: '気質')
Status.create(status_name: '戦術')
Status.create(status_name: 'アイデンティティ')

Attribute.create(attribute_name: '外向的', status_id: 1)
Attribute.create(attribute_name: '内向的', status_id: 1)
Attribute.create(attribute_name: '直感型', status_id: 2)
Attribute.create(attribute_name: '現実型', status_id: 2)
Attribute.create(attribute_name: '論理型', status_id: 3)
Attribute.create(attribute_name: '道理型', status_id: 3)
Attribute.create(attribute_name: '計画型', status_id: 4)
Attribute.create(attribute_name: '探索型', status_id: 4)
Attribute.create(attribute_name: '自己主張型', status_id: 5)
Attribute.create(attribute_name: '慎重型', status_id: 5)