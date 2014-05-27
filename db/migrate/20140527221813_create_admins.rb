class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.boolean :is_admin

      t.timestamps
    end
  end
end
