class School
  attr_reader :db

  def initialize
    @db = Hash.new{ |a,b| a[b] = Array.new }
  end

  def add(name, grade)
    @db[grade] << name
  end

  def sort
    @db.each_value(&:sort!)
    Hash[@db.sort]
  end

  def grade(grade)
    @db[grade]
  end

end