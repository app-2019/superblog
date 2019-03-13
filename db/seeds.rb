# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@tags = Tag.create([{name: 'general'},{name: 'fyi'}])
@author = Author.create(name: 'Karl Stolley')
@post = Post.create(title: 'Seeded Post', slug: 'seeded-post', content: 'Seeded post content.', author: @author, tags: @tags)
