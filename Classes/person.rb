class Person
    attr_reader :id, :name, :age
    attr_writer :name, :age
  
    def initialize(age, name = "Unknown", parent_permission = true)
      @id = generate_id
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    def can_use_services?
      is_of_age? || @parent_permission
    end
  
    private
  
    def is_of_age?
      @age >= 18
    end
  
    def generate_id
      # code to generate a unique ID
    end
  end
  