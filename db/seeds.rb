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
	{title: '印花卫衣', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy/3.jpeg'
			]},
	{title: '印花卫衣', description: '非常舒适，非常柔软',
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy2/3.jpeg'
			]},
	{title: '印花卫衣', description: '非常舒适，非常柔软',
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy3/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy3/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy3/2.jpeg'
			]},
	{title: '印花卫衣', description: '非常舒适，非常柔软',
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy4/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy4/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy4/3.jpeg'
			]},
	{title: '印花卫衣', description: '非常舒适，非常柔软',
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy5/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy5/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/yhwy5/3.jpeg'
			]},
	{title: '漏斗领卫衣', description: '非常舒适，非常柔软',
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/ldlwy/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/ldlwy/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/weiyi/ldlwy/3.jpeg'
			]},
	],
 category: Category.where(name: '卫衣').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '连帽外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt/3.jpeg'
			]},
	{title: '连帽外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt2/3.jpeg'
			]},
	{title: '连帽外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt3/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt3/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt3/3.jpeg'
			]},
	{title: '连帽外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt4/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt4/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmwt4/3.jpeg'
			]},
	{title: '连帽运动外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmydwt/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmydwt/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/waitao/lmydwt/3.jpeg'
			]},
	],
category: Category.where(name: '外套').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '飞行员夹克', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/jiake/fxy/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/jiake/fxy/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/jiake/fxy/3.jpeg'
			]},
	{title: '飞行员夹克', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/jiake/fxy2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/jiake/fxy2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/jiake/fxy2/3.jpeg'
			]},
	],
category: Category.where(name: '夹克').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '印花背心', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yhbx/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yhbx/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yhbx/3.jpeg'
			]},
	{title: '图案背心', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yhbx2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yhbx2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yhbx2/3.jpeg'
			]},
	{title: '图案背心', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yinhua/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yinhua/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/yinhua/3.jpeg'
			]},
	{title: '图案背心上衣', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/tasy/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/tasy/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/tasy/3.jpeg'
			]},
	{title: '图案背心上衣', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/tasy2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/tasy2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/beixin/tasy2/3.jpeg'
			]},
	],
category: Category.where(name: '背心').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '亨利衫', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/hls/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/hls/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/hls/3.jpeg'
			]},
	{title: '印花T桖', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/yhtx/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/yhtx/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/yhtx/3.jpeg'
			]},
	{title: '图案T桖', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/tatx/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/tatx/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/tatx/3.jpeg'
			]},
	{title: '棉质短袖衬衫', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/mzdxcs/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/mzdxcs/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/mzdxcs/3.jpeg'
			]},
	{title: '汗布Polo衫', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/hzpolo/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/hzpolo/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/hzpolo/3.jpeg'
			]},
	{title: '长袖T桖', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/cxtx/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/cxtx/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/chenshan/cxtx/3.jpeg'
			]},
	],
category: Category.where(name: '衬衫').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '慢跑裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mpk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mpk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mpk/3.jpeg'
			]},
	{title: '松紧腰短裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/sjydk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/sjydk/2.jpeg'
			]},
	{title: '棉质斜纹裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzxwk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzxwk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzxwk/3.jpeg'
			]},
	{title: '棉质短裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzdk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzdk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzdk/3.jpeg'
			]},
	{title: '棉质短裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzdk2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzdk2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/mzdk2/3.jpeg'
			]},
	{title: '汗布短裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/hbdk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/hbdk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/hbdk/3.jpeg'
			]},
	{title: '牛仔慢跑裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/nzmpk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/nzmpk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/nzmpk/3.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/nzmpk/4.jpeg'
			]},
	{title: '短卫裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/dwk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/dwk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/dwk/3.jpeg'
			]},
	{title: '西裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/xk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/xk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/boy/kuzhuang/xk/3.jpeg'
			]},
	],
category: Category.where(name: '裤装').select { |c| c.parent == boy_category }.first
},

{info:[
	{title: '抓绒外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zrwt/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zrwt/2.jpeg',
			]},
	{title: '抓绒外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zrwt2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zrwt2/2.jpeg',
			]},
	{title: '抓绒外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zrwt3/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zrwt3/2.jpeg',
			]},
	{title: '抓绒外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zrwt4/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zrwt4/2.jpeg'
			]},
	{title: '连帽外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/lmwt/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/lmwt/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/lmwt/3.jpeg'
			]},
	{title: '针织抓绒外套', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zzzrwt/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/waitao/zzzrwt/2.jpeg'
			]},
	],
category: Category.where(name: '外套').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '2件装连体睡衣', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2jzltsy/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2jzltsy/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2jzltsy/3.jpeg'
			]},
	{title: '2套装睡衣', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2tzsy/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2tzsy/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2tzsy/3.jpeg'
			]},
	{title: '2套装睡衣套装', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2tzsytz/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2tzsytz/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/2tzsytz/3.jpeg'
			]},
	{title: '睡衣', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/sy/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/shuiyi/sy/2.jpeg'
			]},
	],
category: Category.where(name: '睡衣').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '棉质开衫', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/mzks/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/mzks/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/mzks/3.jpeg'
			]},
	{title: '棉质开衫', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/mzks2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/mzks2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/mzks2/3.jpeg'
			]},
	{title: '汗布开衫', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/hbks/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/hbks/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/hbks/3.jpeg'
			]},
	{title: '精细针织开衫', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/jzzzks/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/jzzzks/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/jzzzks/3.jpeg'
			]},
	{title: '罗纹汗布衫', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/lwhbks/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/lwhbks/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/chenshan/lwhbks/3.jpeg'
			]},
	],
category: Category.where(name: '衬衫').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '2条装裤袜', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/2tzkw1/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/2tzkw1/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/2tzkw1/3.jpeg'
			]},
	{title: '2条装裤袜', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/2tzkw2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/2tzkw2/2.jpeg'
			]},
	{title: '2条装裤袜', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/2tzkw3/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/2tzkw3/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/2tzkw3/3.jpeg'
			]},
	{title: '3对装短袜', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/3dzkw/1.jpeg'
			]},
	{title: '5对装踝袜', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/5dzlw/1.jpeg'
			]},
	{title: '提花图案裤袜', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/thtakw/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/thtakw/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/wazi/thtakw/3.jpeg'
			]},
	],
category: Category.where(name: '袜子').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '棉质连衣裙', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/mzlyq/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/mzlyq/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/mzlyq/3.jpeg'
			]},
	{title: '棉质连衣裙', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/mzlyq2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/mzlyq2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/mzlyq2/3.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/mzlyq2/4.jpeg'
			]},
	{title: '汗布连衣裙', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/hblyq/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/hblyq/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/hblyq/3.jpeg'
			]},
	{title: '汗布连衣裙', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/hblyq2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/hblyq2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/hblyq2/3.jpeg'
			]},
	{title: '薄纱连衣裙', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/bslyq/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/bslyq/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/qunzi/bslyq/3.jpeg'
			]},
	],
category: Category.where(name: '裙子').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '七分打底裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/qfddk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/qfddk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/qfddk/3.jpeg'
			]},
	{title: '松紧腰带印花长裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/sjyyhck/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/sjyyhck/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/sjyyhck/3.jpeg'
			]},
	{title: '松紧腰长裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/sjyck/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/sjyck/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/sjyck/3.jpeg'
			]},
	{title: '汗布打底裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/hbddk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/hbddk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/hbddk/3.jpeg'
			]},
	{title: '汗布打底裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/hbddk2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/hbddk2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/hbddk2/3.jpeg'
			]},
	{title: '牛仔短裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/nzdk/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/nzdk/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/nzdk/3.jpeg'
			]},
	{title: '长裤', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/ck/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/ck/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/kuzhuang/ck/3.jpeg'
			]},
	],
category: Category.where(name: '裤装').select { |c| c.parent == girl_category }.first
},

{info:[
	{title: '凉鞋', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx/3.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx/4.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx/5.jpeg'
			]},
	{title: '凉鞋', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx2/3.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx2/4.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/lx2/5.jpeg'
			]},
	{title: '真皮凉鞋', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/zplx/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/zplx/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/zplx/3.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/zplx/4.jpeg'
			]},
	{title: '贴花凉鞋', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/thlx/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/thlx/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/thlx/3.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/thlx/4.jpeg'
			]},
	{title: '贴花凉鞋', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/thlx2/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/thlx2/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/thlx2/3.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/thlx2/4.jpeg'
			]},
	{title: '印花凉鞋', description: '非常舒适，非常柔软', 
		images: [
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/yhlx/1.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/yhlx/2.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/yhlx/3.jpeg',
			'https://s3-ap-northeast-1.amazonaws.com/meizhebao/meizhebao_Images/girl/xiezi/yhlx/4.jpeg'
			]},
	],
category: Category.where(name: '鞋子').select { |c| c.parent == girl_category }.first
},
]



products_info.each do |product|
	product[:info].each_with_index do |p, index|
		cp = Product.create!(
			title: p[:title],
			description: p[:description],
			quantity: rand(9..20),
			price: rand(99..299),
			category: product[:category]
		)

		urls = p[:images]
		if urls 
			urls.each_with_index do |url, index|
				Photo.create(
					product: cp,
					image: open(url)
				)
				puts("#{cp.title}第#{index+1}张图")
			end
		end
		puts("===创建完第#{index+1}个产品(#{cp.title})===")
	end
end

puts 'Product建立完毕'