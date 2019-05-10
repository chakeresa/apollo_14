require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the astronauts index page" do
    # before(:each) do
    #   @book_1 = Book.create!(title: "The Frozen Deep", page_count: 106, year_published: 1874, thumbnail: "https://images.gr-assets.com/books/1328728986l/1009218.jpg")
    #   @book_2 = Book.create!(title: "To Kill a Mockingbird", page_count: 281, year_published: 1960, thumbnail: "https://upload.wikimedia.org/wikipedia/en/7/79/To_Kill_a_Mockingbird.JPG")
    #   @author_1 = @book_1.authors.create!(name: "Wilkie Collins")
    #   @author_2 = @book_1.authors.create!(name: "Charles Dickens")
    #   @author_3 = @book_2.authors.create!(name: "Harper Lee")
    # end

    it "loads the page" do
      visit astronauts_path

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(astronauts_path)
    end
  end
end


# As a visitor,
# When I visit '/astronauts'
# I see a list of astronauts with the following info:
# - Name
# - Age
# - Job
#
# (e.g. "Name: Neil Armstrong, Age: 37, Job: Commander")