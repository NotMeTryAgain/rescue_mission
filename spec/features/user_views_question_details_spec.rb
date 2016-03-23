# As a user
# I want to view a question's details
# So that I can effectively understand the question
#
# Acceptance Criteria
#
# [x] I must be able to get to this page from the questions index
# [x] I must see the question's title
# [x] I must see the question's description

feature "user views question details" do
  let(:question) do
    Question.create(
    title: "What am I? What have I done? Where am I? Who will answer me?",
    description: "What am I? Am I a person? Am I a mere robot with human-esque strength? Is it worth pondering these things? Am I attempting to meet some kind of arbitrary restraint on something"
    )
  end

  scenario "see's details" do
    question
    visit questions_path
    click_link "What am I? What have I done? Where am I? Who will answer me?"
    expect(page).to have_content("What am I? What have I done? Where am I? Who will answer me?")
    expect(page).to have_content("What am I? Am I a person? Am I a mere robot with human-esque strength? Is it worth pondering these things? Am I attempting to meet some kind of arbitrary restraint on something")
  end
end
