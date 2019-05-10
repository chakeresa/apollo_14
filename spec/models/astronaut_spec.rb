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
    before(:each) do
      @astronaut_1 = Astronaut.create!(name: "Buzz Aldrin", age: 40, job: "Space Guy")
      @astronaut_2 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @mission_1 = @astronaut_1.missions.create!(title: "Capricorn 4", time_in_space: 14)
      @mission_2 = @astronaut_1.missions.create!(title: "Apollo 13", time_in_space: 10)
      @mission_3 = @astronaut_1.missions.create!(title: "Gemini 7", time_in_space: 30)
    end

    it "calculates average age of all astronauts" do
      avg_age = (@astronaut_1.age + @astronaut_2.age).to_f / 2

      expect(Astronaut.average_age).to eq(avg_age)
    end
  end

  describe 'Instance Methods' do
    before(:each) do
      @astronaut_1 = Astronaut.create!(name: "Buzz Aldrin", age: 40, job: "Space Guy")
      @astronaut_2 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @mission_1 = @astronaut_1.missions.create!(title: "Capricorn 4", time_in_space: 14)
      @mission_2 = @astronaut_1.missions.create!(title: "Apollo 13", time_in_space: 10)
      @mission_3 = @astronaut_1.missions.create!(title: "Gemini 7", time_in_space: 30)
    end

    it "alphabetizes missions for an astronaut" do
      # test
    end
  end
end
