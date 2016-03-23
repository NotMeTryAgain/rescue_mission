require "rails_helper"

# As a user
# I want to post a question
# So that I can receive help from others
#
# Acceptance Criteria
#
# [x] I must provide a title that is at least 40 characters long
# [x] I must provide a description that is at least 150 characters long
# [x] I must be presented with errors if I fill out the form incorrectly

feature "user posts a question" do
  scenario "successfully posts a question" do
    visit new_question_path

    fill_in "Title", with: "Holy smokes I have no idea what I'm doing. Halp!"
    fill_in "Description", with: "So I don't know what I am doing. I do know this needs to be more than 140 characters though and I am attempting to make sure that I hit that goal.. I think? Did I?"
    click_button "Ask Question"

    expect(page).to have_content("Holy smokes I have no idea what I'm doing. Halp!")
    expect(page).to have_content("So I don't know what I am doing. I do know this needs to be more than 140 characters though and I am attempting to make sure that I hit that goal.. I think? Did I?")
  end

  scenario "blows it when trying to post question" do
    visit new_question_path
    fill_in "Title", with: "Take it, make it"
    fill_in "Description", with: "No I dont think its going to be ok. There is just not enough characters in the title. That is for sure. For sure? For sure. I am sure. Ok is this long enough yet? Yes."
    click_button "Ask Question"
    expect(page).to have_content("1 error prevented this question from being asked")
    expect(page).to have_content("Title is too short (minimum is 40 characters)")

    save_and_open_page
  end
end
