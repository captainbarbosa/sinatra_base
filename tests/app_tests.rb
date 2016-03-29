require "./tests/test_helper"
require './migrations'
require './app'

require './company'
require './department'
require './employee'

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

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal 'I am Groot', last_response.body
  end

  def test_it_says_hello_to_a_person
    get '/', :name => 'Simon'
    assert last_response.body.include?('Groot')
    assert_equal 'I am Groot', last_response.body
  end
end
