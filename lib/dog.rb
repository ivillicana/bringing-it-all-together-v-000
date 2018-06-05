class Dog
  attr_accessor :name, :breed, :id


  def initialize (attributes, id=nil)
    attributes.each {|key, value| self.send("#{key}=", value)}
    @id = id
    @name = name
    @breed = breed
  end
end
