# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rubygem.create([{ name: 'gemstalk' }, 
                { name: 'deprec' },
                { name: 'rails' }])

user = User.create(:email => 'mike@bailey.net.au')

user.rubygems << Rubygem.find_by_name('gemstalk')
user.rubygems << Rubygem.find_by_name('deprec')
