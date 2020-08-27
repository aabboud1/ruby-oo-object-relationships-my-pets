class Cat

  attr_accessor :owner, :mood
  attr_reader :name
  @@cats = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@cats.push(self)
    owner.cats.push(self)
  end

  def self.all
    @@cats
  end

end

#conrad = Owner.new(iuyoarfdouigaerg)
#snuggums = Cat.new("Snuggums",conrad)