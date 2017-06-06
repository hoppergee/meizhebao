  	Product.find_each do |p|
  		p.update( :friendly_id => SecureRandom.uuid)
  	end