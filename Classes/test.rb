require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_Person = CapitalizeDecorator.new(person)
capitalized_Person.correct_name
capitalized_Trimmed_Person = TrimmerDecorator.new(capitalized_Person)
capitalized_Trimmed_Person.correct_name
puts person