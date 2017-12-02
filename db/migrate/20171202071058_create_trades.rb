class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.string :type
      t.decimal :high
      t.decimal :low
      t.decimal :close
      t.decimal :value
      t.string :symbol
      t.string :name
      t.string :volume
      t.datetime :last_updated

      t.timestamps
    end
  end
end
