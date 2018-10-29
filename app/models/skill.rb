class Skill < ApplicationRecord
    has_many :employeeskills
    has_many :employees, through: :employeeskills
    has_and_belongs_to_many :employees
end
