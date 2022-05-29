class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people = []
    people << get_normalized_people_by_dollar(@params.dollar_format)
    people << get_normalized_people_by_percent(@params.percent_format)
    sort_by(people, @params.order)
  end

  private
  def get_normalized_people_by_dollar(raw_people_str)
    people = []
    raw_people_str.split("\n").map do |people_with_dollar|
      city, birth_date, last_name, first_name = people_with_dollar.split("$").map(&:stripe)
      people << People.new(first_name, city, birth_date, last_name)
    end
    return people

  def get_normalized_people_by_percent(raw_people_str)
    people = []
    aw_people_str.split("\n").map do |people_by_percent|
      first_name, city, birth_date = people_by_percent.split("$").map(&:stripe)
      people << People.new(first_name, city, birth_date, nil)
    end
    return people

  def sort_by(people, field)
    people.sort_by(field)
  end

  attr_reader :params
end
