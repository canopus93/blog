# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Riady', email: 'riady.chen@yahoo.com', password: 'asd', is_admin: 'true', activity_count: '0')
User.create(name: 'Test User', email: 'test@user.com', password: 'test', is_admin: 'false', activity_count: '0')
User.create(name: 'Tes User', email: 'tes@user.com', password: 'tes', is_admin: 'false', activity_count: '0')
User.create(name: 'User', email: 'user@user.com', password: 'user', is_admin: 'false', activity_count: '0')

BlogPost.create(title: 'Pesawat Jatuh', summary: 'Ini Hanya Testing Post', content: 'pendek saja', title_image_url: 'http://assets.kompas.com/data/photo/2016/09/27/0234228lintasan-falcon-9780x390.jpg', user_id: 1, view_count: 0)
BlogPost.create(title: 'Iphone 7', summary: 'Ini Hanya Testing Post', content: 'pendek saja', title_image_url: 'http://assets.kompas.com/data/photo/2016/09/08/1618520Pilihan-Warna-iPhone-7-dan-7-Plus780x390.jpg', user_id: 2, view_count: 0)

Tag.create(name: 'blog')
Tag.create(name: 'post')
Tag.create(name: 'test')
Tag.create(name: 'tes')

BlogPostTag.create(blog_post_id: '1', tag_id: '1')
BlogPostTag.create(blog_post_id: '1', tag_id: '2')
BlogPostTag.create(blog_post_id: '2', tag_id: '3')
BlogPostTag.create(blog_post_id: '2', tag_id: '2')