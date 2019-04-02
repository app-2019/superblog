class AddAuthHashFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :login, :string, default: ''
    add_column :authors, :uid, :string, default: ''
    add_column :authors, :email, :string, default: ''
  end
end
