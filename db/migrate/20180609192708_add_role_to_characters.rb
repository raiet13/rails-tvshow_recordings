class AddRoleToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :role, :string
  end
end
