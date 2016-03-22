# As a user
# I want to view a question's details
# So that I can effectively understand the question
#
# Acceptance Criteria
#
# [] I must be able to get to this page from the questions index
# [] I must see the question's title
# [] I must see the question's description

feature "user views question details" do
  let(:question) do
    Question.create(
    title: "What am I?",
    description: "What am I? Am I a person?"
    )
  end

  scenario "see's details" do
    question
    visit questions_path
    click_on "What am I?"

    expect(page).to have_content("What am I?")
    expect(page).to have_content("What am I? Am I a person?")
  end
end
