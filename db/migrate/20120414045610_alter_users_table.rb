class AlterUsersTable < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE users ALTER COLUMN count SET Default 0
    SQL
  end
end
