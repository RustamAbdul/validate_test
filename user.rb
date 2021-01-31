require './base_class'
class User < BaseClass
  attr_accessor :name, :age
  validate :name, present: true
  validate :name, format: /[A-Z]{0,3}/
  validate :age, present: true
  validate :age, type: Integer

  def initialize(name = nil, age = nil)
    @name = name
    @age = age
  end
end

user_1 = User.new('RRR', 13)
user_2 = User.new('RRRR', 13)
user_3 = User.new
p "user_1 valid? #{user_1.valid?}"
p "user_2 valid? #{user_2.valid?}"
p "user_3 valid? #{user_3.valid?}"
p "user_1 validation! #{user_1.validation!}"
p "user_2 validation! #{user_2.validation!}"
p "user_3 validation! #{user_3.validation!}"
