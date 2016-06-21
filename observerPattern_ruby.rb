class Employee
	attr_reader :name, :title
	attr_reader :salary

	def initialize(name,title,salary)
		@name = name
		@title = title
		@salary = salary
		@observers =[]
	end
	def salary=(new_salary)
		@salary = new_salary
		notify_observers
	end
	def notify_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end
	def addObserver(observer)
		@observers << observer
	end
	def removeObserver(observer)
		@observers.delete(obsrever)
	end
end
class Payroll
	def update(changed_employee)
		puts("new check for #{changed_employee.name}")
		puts("new salary is #{changed_employee.salary}")
	end
end
class TaxMan
  def update( changed_employee )
    puts("Send #{changed_employee.name} a new tax bill!")
  end
end


fred = Employee.new('fred','Crane Operator',30000)

payroll = Payroll.new
fred.addObserver(payroll)

tax_man = TaxMan.new
fred.addObserver(tax_man)


fred.salary = 35000
fred.salary = 90000










