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
categories_boy = ['卫衣','衬衫','外套','夹克','背心','裤装']
categories_girl = ['外套','睡衣','衬衫','袜子','裙子','裤装','鞋子']


categories_root.each do |root_name|
	Category.create!(name: root_name)
end

dress_category = Category.find_by(name: "衣服")

categories_gender.each do |gender_name|
	Category.create!(name: gender_name).move_to_child_of(dress_category)
end

boy_category = Category.find_by(name: "男")
girl_category = Category.find_by(name: "女")

categories_boy.each do |cat_name|
	Category.create!(name: cat_name).move_to_child_of(boy_category)
end

categories_girl.each do |cat_name|
	Category.create!(name: cat_name).move_to_child_of(girl_category)
end

dress_category.reload

puts "categories建立完毕"

# ======  男 ==========
products_info = [
{info:[
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '印花卫衣', description: '非常舒适，非常柔软'},
	{title: '漏斗领卫衣', description: '非常舒适，非常柔软'},
	],
 category: Category.where(name: '卫衣').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '连帽运动外套', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '外套').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '飞行员夹克', description: '非常舒适，非常柔软'},
	{title: '飞行员夹克', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '夹克').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '印花背心', description: '非常舒适，非常柔软'},
	{title: '图案背心', description: '非常舒适，非常柔软'},
	{title: '图案背心', description: '非常舒适，非常柔软'},
	{title: '图案背心上衣', description: '非常舒适，非常柔软'},
	{title: '图案背心上衣', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '背心').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '亨利衫', description: '非常舒适，非常柔软'},
	{title: '印花T桖', description: '非常舒适，非常柔软'},
	{title: '图案T桖', description: '非常舒适，非常柔软'},
	{title: '棉质短袖衬衫', description: '非常舒适，非常柔软'},
	{title: '汗布Polo衫', description: '非常舒适，非常柔软'},
	{title: '长袖T桖', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '衬衫').select { |c| c.parent == boy_category }.first
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
category: Category.where(name: '裤装').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '抓绒外套', description: '非常舒适，非常柔软'},
	{title: '抓绒外套', description: '非常舒适，非常柔软'},
	{title: '抓绒外套', description: '非常舒适，非常柔软'},
	{title: '抓绒外套', description: '非常舒适，非常柔软'},
	{title: '连帽外套', description: '非常舒适，非常柔软'},
	{title: '针织抓绒外套', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '外套').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '2件装连体睡衣', description: '非常舒适，非常柔软'},
	{title: '2套装睡衣', description: '非常舒适，非常柔软'},
	{title: '2套装睡衣套装', description: '非常舒适，非常柔软'},
	{title: '睡衣', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '睡衣').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '棉质开衫', description: '非常舒适，非常柔软'},
	{title: '棉质开衫', description: '非常舒适，非常柔软'},
	{title: '汗布开衫', description: '非常舒适，非常柔软'},
	{title: '精细针织开衫', description: '非常舒适，非常柔软'},
	{title: '罗纹汗布衫', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '衬衫').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '2条装裤袜', description: '非常舒适，非常柔软'},
	{title: '2条装裤袜', description: '非常舒适，非常柔软'},
	{title: '2条装裤袜', description: '非常舒适，非常柔软'},
	{title: '3对装短袜', description: '非常舒适，非常柔软'},
	{title: '5对装踝袜', description: '非常舒适，非常柔软'},
	{title: '提花图案裤袜', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '袜子').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '棉质连衣裙', description: '非常舒适，非常柔软'},
	{title: '棉质连衣裙', description: '非常舒适，非常柔软'},
	{title: '汗布连衣裙', description: '非常舒适，非常柔软'},
	{title: '汗布连衣裙', description: '非常舒适，非常柔软'},
	{title: '薄纱连衣裙', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '裙子').select { |c| c.parent == girl_category }.first
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
category: Category.where(name: '裤装').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '凉鞋', description: '非常舒适，非常柔软'},
	{title: '凉鞋', description: '非常舒适，非常柔软'},
	{title: '真皮凉鞋', description: '非常舒适，非常柔软'},
	{title: '贴花凉鞋', description: '非常舒适，非常柔软'},
	{title: '贴花凉鞋', description: '非常舒适，非常柔软'},
	{title: '贴花凉鞋', description: '非常舒适，非常柔软'},
	],
category: Category.where(name: '鞋子').select { |c| c.parent == girl_category }.first
},
]



products_info.each do |product|
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