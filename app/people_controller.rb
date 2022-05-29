class PeopleController
  def initialize(params)
    @params = params
    puts @params
  end

  def normalize
    people = []
    people += get_normalized_people_by_dollar(@params[:dollar_format])
    people += get_normalized_people_by_percent(@params[:percent_format])
    people = sort_by(people, @params[:order])
    people.map{|p| [p.first_name, p.city, p.birth_date].join(", ") }
  end

  private
  def get_normalized_people_by_dollar(raw_people_str)
    raw_people_str.split("\n")[1..-1].map do |people_with_dollar|
      city, birth_date, last_name, first_name = people_with_dollar.split("$").map(&:strip!)
      p = ::People.new(first_name, city, birth_date, last_name)
      ::People.new(first_name, city, birth_date, last_name)
    end
  end

  def get_normalized_people_by_percent(raw_people_str)
    raw_people_str.split("\n")[1..-1].map do |people_by_percent|
      first_name, city, birth_date = people_by_percent.split("%").map(&:strip!)
      ::People.new(first_name, city, birth_date, nil)
    end
  end

  def sort_by(people, field)
    people.sort_by{|p| p.send(field)}
  end

  attr_reader :params
end

#Since model people is not loading.. copy pasted here.

class People
  attr_reader  :first_name, :city, :birth_date, :last_name
  def initialize(first_name, city, birth_date, last_name)
      @first_name = first_name
      @city = city
      @birth_date = birth_date
      @last_name = last_name
   end
end