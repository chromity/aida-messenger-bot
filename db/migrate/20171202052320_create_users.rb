class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :messenger_id
      t.integer :educational_attachment
      t.integer :health_condition
      t.integer :income
      t.integer :expense
      t.integer :goal
      t.boolean :monthly
      t.boolean :yearly
      t.timestamps
    end
  end
end
