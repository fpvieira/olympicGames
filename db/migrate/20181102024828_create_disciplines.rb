class CreateDisciplines < ActiveRecord::Migration[5.2]
  def change
    create_table :disciplines do |t|
      t.string :name
      t.string :slug
      t.string :rule_type

      t.timestamps
    end
    add_index :disciplines, :slug, unique: true
  end
end
