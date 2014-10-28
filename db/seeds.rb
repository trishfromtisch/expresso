# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# meg = User.create({name: "coffeecraver", password: "1234", full_name: Meg Jones", })

brewing_methods = ["unknown", "percolator", "softbrew", "vacuum pot", "pour over", "aeropress", "french press", "technivorm", "chemex", "full immersion (abid, clever, driver)", "cold brew", "turkish"]

beverages = ['other', "Affogato", "Antoccino", "Black eye", "Black tie", "Breve",
'Caffè Americano', 'Café au lait', 'Café bombón', 'Café Cubano', 'Caffè crema', 'Café de olla', 'Caffè latte', 
'Caffè Marocchino', 'Caffè Medici', 'Café miel', 'Coffee milk', 'Café mocha', 'Café Touba', 'Cafe Zorro',
'Ca phe sua da', 'Cappuccino', 'Chai latte', 'iced coffee', 'Cortado', 'Doppio', 'Eggnog latte', 'Eiskaffee',
'Espressino', 'Espresso', 'Espresso Romano', 'ice-blended', 'Flat white', 'Galão', 'Guillermo', 'Greek frappé coffee',
'Green eye', 'Indian filter coffee', 'barako', 'Irish coffee', 'Kopi susu', 'Latte macchiato', 'Liqueur coffee',
'Macchiato', 'Mazagran', 'Mélange', 'Mocha', 'Moka', 'Palazzo', 'Pharisäer', 'Pocillo', 'Red
eye', 'Red tie', 'Ristretto', 'Rüdesheimer kaffee', 'Turkish coffee', 'Vienna', 'coffee', 'White coffee', 'Wiener Melange', 'Yuanyang']

brewing_methods.each do |brewing_method|
	BrewingMethod.create(name: brewing_method)
end

beverages.each do |beverage|
	beverage = beverage.downcase
	Beverage.create(name: beverage)
end
