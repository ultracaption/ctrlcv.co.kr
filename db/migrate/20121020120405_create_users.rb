class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :contact
      t.string :nickname
      t.integer :assessment_count

      t.timestamps
    end
  end
end
