# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# [x] I must provide valid information
# [x] I must be presented with errors if I fill out the form incorrectly
# [x] I must be able to get to the edit page from the question details page

feature "user edits question" do
  let(:question) do
    Question.create(
    title: "What am I? What have I done? Where am I? Who will answer me?",
    description: "What am I? Am I a person? Am I a mere robot with human-esque strength? Is it worth pondering these things? Am I attempting to meet some kind of arbitrary restraint on something"
    )
  end

  scenario "edits a question" do
    question
    visit questions_path
    click_link question.title
    click_link "Edit"
    fill_in "Description", with: "So I don't know what I am doing. I do know this needs to be more than 140 characters though and I am attempting to make sure that I hit that goal.. I think? Did I?"
    click_button "Update"

    expect(page).to have_content(question.title)
    expect(page).to have_content("So I don't know what I am doing. I do know this needs to be more than 140 characters though and I am attempting to make sure that I hit that goal.. I think? Did I?")
  end

  scenario "botches the edit" do
    question
    visit questions_path
    click_link question.title
    click_link "Edit"
    fill_in "Description", with: "Tigers."
    click_button "Update"

    expect(page).to have_content("Tigers.")
    expect(page).to have_content("Description is too short (minimum is 140 characters)")

  end
end
