class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.string :name
      t.boolean :opened, default: true
      t.references :discipline, foreign_key: true

      t.timestamps
    end
    add_index :competitions, :name
  end
end
