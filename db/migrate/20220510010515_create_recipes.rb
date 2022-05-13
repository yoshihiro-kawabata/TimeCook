class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :summary
      t.string :cooktime

      t.timestamps
    end
  end
end
