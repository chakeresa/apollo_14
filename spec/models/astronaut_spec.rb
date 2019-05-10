require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    it "calculates average age of all astronauts" do
      astronaut_1 = Astronaut.create!(name: "Buzz Aldrin", age: 40, job: "Space Guy")
      astronaut_2 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")

      avg_age = (@astronaut_1.age + @astronaut_2.age).to_f / 2

      expect(Astronaut.average_age).to eq(avg_age)
    end
  end
end
