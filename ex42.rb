## Animal is-a object look at the extra credit
class Animal
  def nap()
    puts "zzz"
  end
end

## Dog is-a Animal
class Dog < Animal

  def initialize(name)
    ## Dog has-a name attribute
    @name = name
  end

  def fetch(thrown_thing)
    puts "#{thrown_thing}!"
  end
end

## Cat is-a Animal
class Cat < Animal

  def initialize(name)
    ## Cat has-a name attribute
    @name = name
  end

  def fetch(thrown_thing)
    puts "..."
  end
end

## Person is-a object
class Person

  def initialize(name)
    ## person has-a name attribute
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet
end

## Employee is a Person
class Employee < Person

  def initialize(name, salary)
    ## Employee inherits some of Initialize from Person
    super(name)
    ## Salary is new though, Employee has-a Salary atribute
    @salary = salary
  end

end

## Fish is-a object
class Fish
  def blub()
    puts "blub blub"
  end
end

## Salmon is a Fish, which is-s object
class Salmon < Fish
  def spawn()
    puts "Swimmin' up river!"
  end
end

## ??
class Halibut < Fish
  def for_the(halibut)
    puts "Get it, halibut?"
  end
end


## rover is-a Dog (and therefore also an animal)
rover = Dog.new("Rover")

## satan is a cat (And therefore also an animal)
# this human does not like cats...
satan = Cat.new("Satan")

## Mary is-a person
mary = Person.new("Mary")

## Mary has-a pet, that pet is Satan from earlier
mary.pet = satan

## Frank is-a Employee (and therefore also a Person)
frank = Employee.new("Frank", 120000)

## Frank has-a pet, that pet is rover
frank.pet = rover
frank.pet.fetch("Ball")
mary.pet.fetch("Stick")

## Flipper is-a Fish ((Lies.))
flipper = Fish.new()

## crouse is-a salmon (and thusly also a fish)
crouse = Salmon.new()
crouse.spawn()
crouse.blub()


## harry is a Halibut.  He's down for a good time.
harry = Halibut.new()
harry.for_the("harry")

satan.nap()
rover.nap()
# crouse.nap()
# hunh... Fish ain't an Animal.
