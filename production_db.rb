require './migrations.rb'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'db.sqlite3'
})

CompanyDataMigration.migrate(:up)
