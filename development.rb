require './migrations.rb'
require './department.rb'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db.sqlite3'
)

# Initial DB seed, excluded after creation

# emp_1 = Employee.create!(name: "Bob", email: "bob@mail.com", phone: "111-111-1111", salary: 50000.00)
# emp_2 = Employee.create!(name: "Linda", email: "linda@mail.com", phone: "222-222-2222", salary: 40000.00)
# emp_3 = Employee.create!(name: "Tina", email: "tina@mail.com", phone: "333-333-3333", salary: 30000.00)
# emp_4 = Employee.create!(name: "Gene", email: "gene@mail.com", phone: "444-444-4444", salary: 20000.00)
# emp_5 = Employee.create!(name: "Louise", email: "louise@mail.com", phone: "555-555-5555", salary: 10000.00)
#
# t = Department.create!(name: "Bob's Burgers")
#
# t.employees = [emp_1, emp_2, emp_3, emp_4, emp_5]
#
# t.save!
