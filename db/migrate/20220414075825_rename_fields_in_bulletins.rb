class RenameFieldsInBulletins < ActiveRecord::Migration[6.1]
  def change
    rename_column :bulletins, :name, :title
    rename_column :bulletins, :body, :description
  end
end
