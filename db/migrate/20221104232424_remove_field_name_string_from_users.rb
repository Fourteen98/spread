class RemoveFieldNameStringFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :string, :string
  end
end
