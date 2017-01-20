class CreateSecondFactorsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :second_factors_users do |t|
      t.integer :user_id
      t.integer :second_factor_id
    end
  end
end
