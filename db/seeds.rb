# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
	user2 = User.create(:first_name => 'rodrigo', :last_name => 'meoño', :email => 'rodrigo.me13@hotmail.com', :password => 'abcd', :role => 'editor')
	user3 = User.create(:first_name => 'rodrigo', :last_name => 'meoño', :email => 'rodrigo@email.com', :password => 'abc', :role => 'admin')
	
	c1 = Country.create(title:"Guatemala", image: "/images/art/fs-cover.jpg")

	t1 = Tag.create(title: "Peten", image: "/images/yaxha/yaxha.jpg", country_id: c1.id)
	Destination.create(name: "Yaxha", description: "I will put a really cool description later", image: "/images/yaxha/yaxha.jpg", tag_id: t1.id)
 	
	t2 = Tag.create(title: "Escuintla", image: "/images/paredon/paredon.jpg", country_id: c1.id)
	Destination.create(name: "Driftwood Surfer", description: "Awesome place!", image: "/images/paredon/paredon.jpg", tag_id: t2.id)

	t3 = Tag.create(title: "Ciudad de Guatemala", image: "/images/ciudad/ciudad.jpg", country_id: c1.id)
	Destination.create(name: "Centro Historico", description: "Same, but different, but still same", image: "/images/ciudad/ciudad.jpg", tag_id: t3.id)
