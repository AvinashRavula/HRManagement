class CreateEmployeesSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :employees_skills do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :skill, index: true

      t.timestamps
    end
  end
end
