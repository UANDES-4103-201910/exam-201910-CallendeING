# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [User.new(fName:'Juan ', lName:'Perez', password: '123456', \
    email:'jperez@miuandes.cl')] 
for u in users do
    u.save!
end
    products = [Product.new(brand:'Samsung', model:'S9', variant:'black', price:'300000',\
        shortDescription:'Phone', longDescription:'Android device'),Product.new(brand:'Huawei', model:'p30', variant:'pro', price:'600000',\
            shortDescription:'Phone', longDescription:'Android device'),Product.new(brand:'LG', model:'brigi3', variant:'pro', price:'0',\
                shortDescription:'Phone', longDescription:'Android device'),Product.new(brand:'Apple', model:'3gs', variant:'s', price:'10000',\
                    shortDescription:'Phone', longDescription:'Android device')]
for p in products do
    p.save!
end


