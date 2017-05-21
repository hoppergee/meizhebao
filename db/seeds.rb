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


categories_root = ['书','活动','课程','衣服']
categories_gender = ['男', '女'] # 男 5 女 6
categories_season = ['春夏','秋冬'] # 春夏 7 秋冬 8
categories_boy = ['卫衣','衬衫','外套','夹克','背心','裤装']
categories_girl = ['外套','睡衣','衬衫','袜子','裙子','裤装','鞋子']


categories_root.each do |root_name|
	Category.create!(name: root_name)
end

dress_category = Category.find_by(name: "衣服")

categories_gender.each do |gender_name|
	Category.create!(name: gender_name).move_to_child_of(dress_category)
end

@boy_category = Category.find_by(name: "男")
@girl_category = Category.find_by(name: "女")

categories_season.each do |season_name|
	season = Category.create!(name: season_name)
	season.move_to_child_of(@boy_category)
	categories_boy.each do |cat_name|
		Category.create!(name: cat_name).move_to_child_of(season)
	end
end

categories_season.each do |season_name|
	season = Category.create!(name: season_name)
	season.move_to_child_of(@girl_category)
	categories_girl.each do |cat_name|
		Category.create!(name: cat_name).move_to_child_of(season)
	end
end

dress_category.reload

puts "categories建立完毕"

def girl_random_category(name)
	Category.where(name: name).select { |c| 
	if rand(1..100) < 80
		c.parent.parent == @girl_category && c.parent.name == "春夏"
	else
		c.parent.parent == @girl_category && c.parent.name == "秋冬"
	end
	}.first
end

def boy_random_category(name)
	Category.where(name: name).select { |c| 
	if rand(1..100) < 80
		c.parent.parent == @boy_category && c.parent.name == "春夏"
	else
		c.parent.parent == @boy_category && c.parent.name == "秋冬"
	end
	}.first
end

# ======  男 ==========
boy_products_info = [
{info:[
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '漏斗领卫衣', description: '非常舒适，非常柔软'},
	],
category: boy_random_category('卫衣')
},

{info:[
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '连帽运动外套', description: '非常舒适，非常柔软'},
	],
category: boy_random_category('外套')
},

{info:[
	{title: '飞行员夹克', description: '非常舒适，非常柔软'},
	{title: '飞行员夹克', description: '非常舒适，非常柔软'},
	],
category: boy_random_category('夹克')
},

{info:[
	{title: '印花背心', description: '非常舒适，非常柔软'},
	{title: '图案背心', description: '非常舒适，非常柔软'},
	{title: '图案背心', description: '非常舒适，非常柔软'},
	{title: '图案背心上衣', description: '非常舒适，非常柔软'},
	{title: '图案背心上衣', description: '非常舒适，非常柔软'},
	],
category: boy_random_category('背心')
},

{info:[
	{title: '亨利衫', description: '非常舒适，非常柔软'},
	{title: '印花T桖', description: '非常舒适，非常柔软'},
	{title: '图案T桖', description: '非常舒适，非常柔软'},
	{title: '棉质短袖衬衫', description: '非常舒适，非常柔软'},
	{title: '汗布Polo衫', description: '非常舒适，非常柔软'},
	{title: '长袖T桖', description: '非常舒适，非常柔软'},
	],
category: boy_random_category('衬衫')
},

{info:[
	{title: '慢跑裤', description: '非常舒适，非常柔软'},
	{title: '松紧腰短裤', description: '非常舒适，非常柔软'},
	{title: '棉质斜纹裤', description: '非常舒适，非常柔软'},
	{title: '棉质短裤', description: '非常舒适，非常柔软'},
	{title: '棉质短裤', description: '非常舒适，非常柔软'},
	{title: '汗布短裤', description: '非常舒适，非常柔软'},
	{title: '牛仔慢跑裤', description: '非常舒适，非常柔软'},
	{title: '短卫裤', description: '非常舒适，非常柔软'},
	{title: '西裤', description: '非常舒适，非常柔软'},
	],
category: boy_random_category('裤装')
}]

girl_products_info = [
{info:[
	{title: '抓绒外套', description: '非常舒适，非常柔软'},
	{title: '抓绒外套', description: '非常舒适，非常柔软'},
	{title: '抓绒外套', description: '非常舒适，非常柔软'},
	{title: '抓绒外套', description: '非常舒适，非常柔软'},
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '针织抓绒外套', description: '非常舒适，非常柔软'},
	],
category: girl_random_category('外套')
},

{info:[
	{title: '2件装连体睡衣', description: '非常舒适，非常柔软'},
	{title: '2套装睡衣', description: '非常舒适，非常柔软'},
	{title: '2套装睡衣套装', description: '非常舒适，非常柔软'},
	{title: '睡衣', description: '非常舒适，非常柔软'},
	],
category: girl_random_category('睡衣')
},

{info:[
	{title: '棉质开衫', description: '非常舒适，非常柔软'},
	{title: '棉质开衫', description: '非常舒适，非常柔软'},
	{title: '汗布开衫', description: '非常舒适，非常柔软'},
	{title: '精细针织开衫', description: '非常舒适，非常柔软'},
	{title: '罗纹汗布衫', description: '非常舒适，非常柔软'},
	],
category: girl_random_category('衬衫')
},

{info:[
	{title: '2条装裤袜', description: '非常舒适，非常柔软'},
	{title: '2条装裤袜', description: '非常舒适，非常柔软'},
	{title: '2条装裤袜', description: '非常舒适，非常柔软'},
	{title: '3对装短袜', description: '非常舒适，非常柔软'},
	{title: '5对装踝袜', description: '非常舒适，非常柔软'},
	{title: '提花图案裤袜', description: '非常舒适，非常柔软'},
	],
category: girl_random_category('袜子')
},

{info:[
	{title: '棉质连衣裙', description: '非常舒适，非常柔软'},
	{title: '棉质连衣裙', description: '非常舒适，非常柔软'},
	{title: '汗布连衣裙', description: '非常舒适，非常柔软'},
	{title: '汗布连衣裙', description: '非常舒适，非常柔软'},
	{title: '薄纱连衣裙', description: '非常舒适，非常柔软'},
	],
category: girl_random_category('裙子')
},

{info:[
	{title: '七分打底裤', description: '非常舒适，非常柔软'},
	{title: '松紧腰带印花长裤', description: '非常舒适，非常柔软'},
	{title: '松紧腰长裤', description: '非常舒适，非常柔软'},
	{title: '汗布打底裤', description: '非常舒适，非常柔软'},
	{title: '汗布打底裤', description: '非常舒适，非常柔软'},
	{title: '牛仔短裤', description: '非常舒适，非常柔软'},
	{title: '长裤', description: '非常舒适，非常柔软'},
	],
category: girl_random_category('裤装')
},

{info:[
	{title: '凉鞋', description: '非常舒适，非常柔软'},
	{title: '凉鞋', description: '非常舒适，非常柔软'},
	{title: '真皮凉鞋', description: '非常舒适，非常柔软'},
	{title: '贴花凉鞋', description: '非常舒适，非常柔软'},
	{title: '贴花凉鞋', description: '非常舒适，非常柔软'},
	{title: '贴花凉鞋', description: '非常舒适，非常柔软'},
	],
category: girl_random_category('鞋子')
},
]

# puts "鞋子: #{Category.find_by(name: '鞋子').id}"
# puts "鞋子: #{Category.where(name: '鞋子').select{ |c| c.parent.parent == girl_category && c.parent.name == "春夏" }}"

	# puts "products_info::::->#{products_info.first[:category]}"



boy_products_info.each do |product|
	product[:info].each do |p|
		puts "#{product[:category]}"
		Product.create!(
			title: p[:title],
			description: p[:description],
			quantity: rand(9..20),
			price: rand(99..299),
			category_id: product[:category].id
		)
	end
end

girl_products_info.each do |product|
	product[:info].each do |p|
		Product.create!(
			title: p[:title],
			description: p[:description],
			quantity: rand(9..20),
			price: rand(99..299),
			category: product[:category]
		)
	end
end

puts 'Product建立完毕'
