require "./tests/test_helper"
require './migrations'
require './app'
require './company'
require './department'
require './employee'
require 'pry'

# Initialize test DB
ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'test.sqlite3'
)

# Create/Destroy test DB when test is run
begin CompanyDataMigration.migrate(:down); rescue; end
CompanyDataMigration.migrate(:up)


# Begin tests
class AppTest < Minitest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    begin CompanyDataMigration.migrate(:down); rescue; end
    CompanyDataMigration.migrate(:up)

    @emp_1 = Employee.create!(name: "Bob", email: "bob@mail.com", phone: "111-111-1111", salary: 50000.00)
    @emp_2 = Employee.create!(name: "Linda", email: "linda@mail.com", phone: "222-222-2222", salary: 40000.00)
    @emp_3 = Employee.create!(name: "Tina", email: "tina@mail.com", phone: "333-333-3333", salary: 30000.00)
    @emp_4 = Employee.create!(name: "Gene", email: "gene@mail.com", phone: "444-444-4444", salary: 20000.00)
    @emp_5 = Employee.create!(name: "Louise", email: "louise@mail.com", phone: "555-555-5555", salary: 10000.00)

    @t = Department.create!(name: "Bob's Burgers")
    @t.employees = [@emp_1, @emp_2, @emp_3, @emp_4, @emp_5]
    @t.save!
  end


  def test_can_list_employees_through_endpoint
    # Replicate web app at current endpoint
    response = get '/employees'

    assert response.ok?
    assert_equal @t.employees.to_json, response.body
    # binding.pry
  end

  def test_can_list_an_individual_employee_through_endpoint
    response = get '/employees/1'

    assert response.ok?
    assert_equal @t.employees.find_by(1).to_json, response.body
  end

  def test_can_create_a_new_employee_through_endpoint
    hash = {name: 'Nadia'}
    response = post("/employees", hash.to_json, { "CONTENT_TYPE" => "application/json" })
    body = JSON.parse(response.body)

    assert response.ok?
    assert_equal "Nadia", body["name"]
  end

  def test_employee_can_be_deleted
    response = delete '/employees/1'

    assert response.ok?
    assert_equal nil, @t.employees.find_by(name: "Bob")
  end

end
