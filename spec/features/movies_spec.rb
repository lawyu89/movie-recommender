require 'rails_helper'

RSpec.feature "Movies", type: :feature do

  describe "Movie Controller", js: true do
    before(:all) do
      @flight = Flight.create(path_name: "SFO - LAX", travel_time: 7200)
      test1_genre = Genre.create(name: "test1_genre")
      test2_genre = Genre.create(name: "test2_genre")
      movie1 = Movie.create(name: "Movie1", rating: 7.0, released_year: 2008, movie_length: 3600, thumbnail_url: Faker::Avatar.image)
      test1_genre.movies << movie1
      movie2 = Movie.create(name: "Movie2", rating: 8.0, released_year: 2010, movie_length: 4000, thumbnail_url: Faker::Avatar.image)
      test2_genre.movies << movie2
      movie3 = Movie.create(name: "Movie3", rating: 3.8, released_year: 2009, movie_length: 5000, thumbnail_url: Faker::Avatar.image)
      test1_genre.movies << movie3
      @questions = Question.create(title: "Test Question")
      Answer.create(content: "test1", question_id: @questions.id, genre_id:test1_genre.id)
      Answer.create(content: "test2", question_id: @questions.id, genre_id:test2_genre.id)
    end
    describe "Home Page" do
      scenario "have a start button" do
        visit '/index'
        expect(page).to have_button('Start Personality Quiz')
        # save_and_open_page
      end
      scenario "show a question when start button is pressed" do
        visit '/index'
        click_button 'Start Personality Quiz'
        expect(page).to have_content('Test Question')
      end
      scenario "show error message if no options are selected" do
        visit '/index'
        click_button 'Start Personality Quiz'
        click_button 'See Results'
        expect(page).to have_content('Please Choose An Option')
      end
      scenario "show movie related to genre picked" do
        visit '/index'
        click_button 'Start Personality Quiz'
        page.find(:xpath, '//input[following-sibling::text()[1][normalize-space(.) = "test1"]]').set(true)
        click_button 'See Results'
        expect(page).to have_content('Movie1')
      end
      scenario "show more information after clicking on image" do
        visit '/index'
        click_button 'Start Personality Quiz'
        find(:xpath, '//input[following-sibling::text()[1][normalize-space(.) = "test1"]]').set(true)
        click_button 'See Results'
        find('.front').click
        expect(page).to have_content('test1_genre')
      end
      scenario "do not show movie with unrelated genre" do
        visit '/index'
        click_button 'Start Personality Quiz'
        find(:xpath, '//input[following-sibling::text()[1][normalize-space(.) = "test1"]]').set(true)
        click_button 'See Results'
        find('.front').click
        expect(page).to have_no_content('test2_genre')
      end
      scenario "do not show movie's with ratings less than 4" do
        visit '/index'
        click_button 'Start Personality Quiz'
        find(:xpath, '//input[following-sibling::text()[1][normalize-space(.) = "test1"]]').set(true)
        click_button 'See Results'
        find('.front').click
        expect(page).to have_no_content('Movie3')
      end
    end
  end


end
