require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the astronauts index page" do
    before(:each) do
      @astronaut_1 = Astronaut.create!(name: "Buzz Aldrin", age: 40, job: "Space Guy")
      @astronaut_2 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      #   @author_1 = @book_1.authors.create!(name: "Wilkie Collins")
      #   @author_2 = @book_1.authors.create!(name: "Charles Dickens")
      #   @author_3 = @book_2.authors.create!(name: "Harper Lee")
    end

    it "loads the page" do
      visit astronauts_path

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(astronauts_path)
    end

    it "displays info for all astronauts" do
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
  end
end