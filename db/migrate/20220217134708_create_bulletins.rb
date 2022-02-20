class CreateBulletins < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletins do |t|
      t.string :name
      t.string :body
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
