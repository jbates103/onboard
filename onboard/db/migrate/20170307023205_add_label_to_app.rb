class AddLabelToApp < ActiveRecord::Migration[5.0]
  def change
  	add_column :apps, :label, :integer
  end
end
