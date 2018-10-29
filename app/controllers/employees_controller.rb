class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create 
        e = employee_params.to_h
        skills = e.delete("skills")
        # binding.pry
        @employee = Employee.new(e)
        if @employee.save 
            skills = skills.select{ |skill| skill != ""}
            print skills
            # @employee.skills = skills
            for skill in skills
                puts skill
                employee_skill_data = Hash.new
                employee_skill_data["employee_id"] = @employee.id
                employee_skill_data["skill_id"] = skill.to_i
                EmployeesSkill.create(employee_skill_data)
            end
            redirect_to '/employees' 
        else 
          render 'new' 
        end 
    end

    def edit
        @employee = Employee.find(params[:id])
    end
      
    def show
        @employee = Employee.find(params[:id])
        @skills = @employee.skills
    end

    def show_employees_under_team_lead
        @employees = []
        puts params[:id]
        Employee.where("employee_id = ?", params[:id]).each do |employee|
            employee_data = Hash.new
            employee_data["name"] = employee.name
            employee_data["skills_count"] = employee.skills.count
            @employees.push(employee_data)
        end
        # @employees.sort_by! {|hsh| hsh["name"]}
        @employees.sort_by! {|hsh| hsh["skills_count"]}.reverse!
        print @employees
    end

    def update
        @employee = Employee.find(params[:id])
       
        if @employee.update(employee_params)
          redirect_to @employee
        else
          render 'edit'
        end
    end

    def destroy
        Employee.find(params[:id]).destroy
      
        redirect_to employees_path
    end

    private 
        def employee_params 
            params.require(:employee).permit(:name,:designation,:age,:date_of_joining,:employee_id,:project_id,skills: []) 
        end

end
