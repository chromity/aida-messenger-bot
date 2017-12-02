class AddHousingToInsurance < ActiveRecord::Migration[5.0]
  def change
    add_column :insurances, :housing, :decimal
  end
end
