# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << admin.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

group = Group.create!(:name => '*', :author => admin)
puts "Created Empty Group with name: #{group.name}, author: #{admin.name}"

topic_controller = ControllerPage.create!(:name => 'topics', :author => admin)
topic_controller.access_controls.build(:control => "allow", :group => group, :create_access => true, :read_access => true)
topic_controller.save
puts "Created ControllerPage with name: #{topic_controller.name}, author: #{admin.name}"

group_controller = ControllerPage.create!(:name => 'groups', :author => admin)
group_controller.access_controls.build(:control => "allow", :group => group, :create_access => true, :read_access => true)
group_controller.save
puts "Created ControllerPage with name: #{group_controller.name}, author: #{admin.name}"

page_controller = ControllerPage.create!(:name => 'pages', :author => admin, :parent_control => topic_controller)
page_controller.access_controls.build(:control => "allow", :group => group, :create_access => true, :read_access => true)
page_controller.save
puts "Created ControllerPage with name: #{page_controller.name}, author: #{admin.name}"

thing_controller = ControllerPage.create!(:name => 'things', :author => admin, :parent_control => topic_controller)
puts "Created ControllerPage with name: #{thing_controller.name}, author: #{admin.name}"

kind_controller = ControllerPage.create!(:name => 'kinds', :author => admin, :parent_control => thing_controller)
puts "Created ControllerPage with name: #{kind_controller.name}, author: #{admin.name}"
