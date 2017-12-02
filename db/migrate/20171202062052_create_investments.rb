class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :investments do |t|
      t.string :type
      t.boolean :housing
      t.boolean :sickness
      t.boolean :disability
      t.boolean :maternity
      t.boolean :retirement
      t.boolean :funeral
      t.boolean :death
      t.boolean :education
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
