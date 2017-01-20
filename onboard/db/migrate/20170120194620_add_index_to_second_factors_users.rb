class AddIndexToSecondFactorsUsers < ActiveRecord::Migration[5.0]
  def change
  	add_index :second_factors_users, [:second_factor_id, :user_id], unique: true 
  end
end
