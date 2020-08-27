class Owner
  # code goes here
  attr_reader :name, :species
  @@owners = []
  attr_accessor :cats, :dogs

  def initialize(name)
    @name = name
    @species = "human"
    @@owners.push(self)
    @cats = []
    @dogs = []
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.count
  end

  def self.reset_all
    @@owners.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_cat(name)
    name = Cat.new("#{name}", self)
  end

  def buy_dog(name)
    name = Dog.new("#{name}", self)
  end

  def walk_dogs
    self.change_pets_mood(self.dogs, "happy")
  end

  def feed_cats
    self.change_pets_mood(self.cats, "happy")
  end

  def change_pets_mood(pets, mood)
    pets.each do |pet|
      pet.mood = mood
    end
  end

  def reset_pets_owner(pets)
    pets.each do |pet|
      pet.owner = nil
      pets.delete(pet)
    end
  end

  def sell_pets
    self.change_pets_mood(self.cats, "nervous")
    self.reset_pets_owner(self.cats)
    self.change_pets_mood(self.dogs, "nervous")
    self.reset_pets_owner(self.dogs)
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end