# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "admin@qq.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

products_info = [
	{title: '柔软舒适针织背心', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '小猪班纳圆领上衣', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '尼龙夏季短袖', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '灯芯绒短裤', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '新款蝴蝶结时尚风衣', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '手织背心', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '亮色运动体桖', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '清爽短裙', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '纯棉圆领上衣', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '公主套装', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '港菲外套防晒', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '361童装休闲体桖', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '百搭衬衣', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '休闲打底', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '圆领吸汗', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '防蚊体桖', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '激光背心', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '卡通长袖', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '圆领印花', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '酷炫墨镜', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
	{title: '安踏针织裤', description: '非常舒适，非常柔软', quantity: 11, price: 9000},
]

categories_1 = ['书','活动','课程','衣服']
categories_2 = ['裤装','衬衫&汗衫','毛衣&卫衣','裙子','裤装','睡衣','夹克&大衣','内衣裤']

categories_1.each do |cat_name|
	Category.create!(name: cat_name)
end

dress_category = Category.find_by(name: "衣服")

categories_2.each do |cat_name|
	Category.create!(name: cat_name).move_to_child_of(dress_category)
end

dress_category.reload

puts "categories建立完毕"

products_info.each do |info|
	Product.create!(
		title: info[:title],
		description: info[:description],
		quantity: info[:quantity],
		price: rand(5..20),
		category: dress_category.leaves.sample
	)
end

puts 'Product建立完毕'
