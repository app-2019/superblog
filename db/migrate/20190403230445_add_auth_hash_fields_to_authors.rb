class AddAuthHashFieldsToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :uid, :string, default: ''
    add_column :authors, :nickname, :string, default: ''
    add_column :authors, :email, :string, default: ''
  end
end
