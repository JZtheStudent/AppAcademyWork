require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name 
        @funding = funding 
        @salaries = salaries 
        @employees = []
    end

    def valid_title?(title)
        @salaries.include?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(name, title)
        if valid_title?(title)
            @employees << Employee.new(name, title)
        else 
            raise "Invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(emp)
        amt = @salaries[emp.title]
        if @funding >= amt
            emp.pay(amt)
            @funding -= amt
        else
            raise "Insufficient funding"
        end
    end

    def payday
        @employees.each { |emp| pay_employee(emp) }
    end

    def average_salary
        @employees.inject(0) { |acc, emp| acc + @salaries[emp.title] } / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.include?(title)}
        startup.employees.each { |emp| @employees << emp }
        startup.close 
    end

end
