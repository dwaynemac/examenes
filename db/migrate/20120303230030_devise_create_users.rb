class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.cas_authenticatable
      t.timestamps
    end

    add_index :users, :username, :unique => true
  end

end
