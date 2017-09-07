class Zoo
  attr_reader :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    initialize_cages
    @employees = []
  end

  def initialize_cages
    @cages = []
    10.times { @cages << Cage.new }
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date.between?(@season_opening_date, @season_closing_date)
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        break
      end
    end
  end

  def visit
    zoo_greeting = ""
    @employees.each do |employee|
      zoo_greeting += "#{employee.name} waved hello!\n"
    end

    @cages.each do |cage|
      if !cage.empty?
        zoo_greeting += "#{cage.animal.speak}\n"
      end
    end

    zoo_greeting
  end
end
