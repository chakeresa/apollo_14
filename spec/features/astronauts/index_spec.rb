require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the astronauts index page" do
    before(:each) do
      @astronaut_1 = Astronaut.create!(name: "Buzz Aldrin", age: 40, job: "Space Guy")
      @astronaut_2 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @mission_1 = @astronaut_1.missions.create!(title: "Capricorn 4", time_in_space: 14)
      @mission_2 = @astronaut_1.missions.create!(title: "Apollo 13", time_in_space: 10)
      @mission_3 = @astronaut_1.missions.create!(title: "Gemini 7", time_in_space: 30)
    end

    it "loads the page" do
      visit astronauts_path

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(astronauts_path)
    end

    it "displays info for all astronauts" do
      visit astronauts_path

      within("#astronaut-#{@astronaut_1.id}") do
        expect(page).to have_content("Name: #{@astronaut_1.name}")
        expect(page).to have_content("Age: #{@astronaut_1.age}")
        expect(page).to have_content("Job: #{@astronaut_1.job}")
      end

      within("#astronaut-#{@astronaut_2.id}") do
        expect(page).to have_content("Name: #{@astronaut_2.name}")
        expect(page).to have_content("Age: #{@astronaut_2.age}")
        expect(page).to have_content("Job: #{@astronaut_2.job}")
      end
    end

    it "shows the average age of all astronauts" do
      visit astronauts_path

      avg_age = (@astronaut_1.age + @astronaut_2.age).to_f / 2

      within("#statistics") do
        expect(page).to have_content("Average Age: #{avg_age}")
      end
    end

    it "lists an astronauts missions alphabetically by title" do
      visit astronauts_path

      within("#astronaut-#{@astronaut_1.id}") do
        within(".missions") do
          expect(page.all('li')[0]).to have_content("Apollo 13")
          expect(page.all('li')[1]).to have_content("Capricorn 4")
          expect(page.all('li')[2]).to have_content("Gemini 7")
        end
      end
    end
  end
end