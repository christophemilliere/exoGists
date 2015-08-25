class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :name
      t.string :user
      t.string :avatar
      t.string :gists_id
      t.references :company, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
