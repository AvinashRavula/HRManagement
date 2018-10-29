class CreateEmployees < ActiveRecord::Migration[5.2]
  # has_and_belongs_to_many :skills
  def change
    create_table :employees do |t|
      t.text :name
      t.text :designation
      t.integer :age
      t.date :date_of_joining
      t.belongs_to :employee, foreign_key: {on_delete: :cascade}
      t.belongs_to :project, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
