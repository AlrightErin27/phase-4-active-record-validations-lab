# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pp 'Creating Authors...'
p = Author.create(name: 'Pugsley', phone_number: '666-1234')
m = Author.create(name: 'Morticia', phone_number: '666-5678')
g = Author.create(name: 'Gomez', phone_number: '666-9101')
w = Author.create(name: 'Wednesday', phone_number: '666-1121')

pp 'Creating Posts...'
Post.create(
  title: 'A mask tells us more than a face.',
  content: 'This is content.😈',
  summary: 'tell me a story',
  category: 'horror',
  author_id: p.id,
)
Post.create(
  title: 'Ill stop wearing black when they make a darker color.',
  content: 'This is content. ',
  summary: 'fashion statements',
  category: 'fashion',
  author_id: m.id,
)
Post.create(
  title: 'Hexes in the hexagon garden.',
  content: 'This is content.🎃',
  summary: 'how to on spells',
  category: 'education',
  author_id: g.id,
)
Post.create(
  title: 'The nightmare dairy',
  content: 'This is content.🩸',
  summary: 'I read you all my best nightmares.',
  category: 'horror',
  author_id: w.id,
)
Post.create(
  title: 'A candy a day keeps the monsters away.',
  content: 'This is content.🕶',
  summary: 'How to undo what the dentist did to you.',
  category: 'education',
  author_id: w.id,
)
