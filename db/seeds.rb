# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Discipline.create(name: 'One Hundred Metre Dash', slug: 'one-hundred-metre-dash', rule_type: 'ShorterTimeRule')
Discipline.create(name: 'Javelin Throw', slug: 'javelin-throw', rule_type: 'LongestThrownOnThreeAttemptsRule')