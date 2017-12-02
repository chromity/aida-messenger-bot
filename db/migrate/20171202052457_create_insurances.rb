class CreateInsurances < ActiveRecord::Migration[5.0]
  def change
    create_table :insurances do |t|
      t.references :user, foreign_key: true
      t.decimal :sickness
      t.decimal :disability
      t.decimal :maternity
      t.decimal :retirement
      t.decimal :funeral
      t.decimal :death
      t.decimal :education

      t.timestamps
    end
  end
end
