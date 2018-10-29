class Employee < ApplicationRecord
    has_many :employeeskills
    has_many :skills, through: :employeeskills
    has_and_belongs_to_many :skills
    # validates :name, presence: { message: "must be given please" }
    # validates :designation, presence: true
    # validates :age, presence: true
    # validates :date_of_joining, presence: true
end
