class People
	attr_reador  :first_name, :city, :birth_date, :last_name
	def initialize(first_name, city, birth_date, last_name)
      @first_name = first_name
      @city = city
      @birth_date = birth_date
      @last_name = last_name
   end
end