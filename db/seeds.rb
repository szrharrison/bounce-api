# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.destroy_all
Project.destroy_all
User.destroy_all
Account.destroy_all

account = Account.create({email: "some-test-email@example.com", password: "some-password"})

user = User.create({first_name: "Scott", last_name: "Zimmerman", account: account})

project = Project.create({name: "Some Project", user: user})

Task.create([
                {name: "Some First Task", user: user, urgency: 2, importance: 0, easy_startable: false},
                {name: "Some Second Task", user: user, urgency: 1, importance: 3, easy_startable: false, due_date: DateTime.now},
                {name: "Some First Project Task", user: user, project: project, urgency: 4, importance: 2, easy_startable: true},
                {name: "Some Second Project Task", user: user, project: project, urgency: 3, importance: 4, easy_startable: false},
            ])
