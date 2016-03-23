# As a user
# I want to answer another user's question
# So that I can help them solve their problem
#
# Acceptance Criteria
#
# [x] I must be on the question detail page
# [x] I must provide a description that is at least 50 characters long
# [x] I must be presented with errors if I fill out the form incorrectly

feature "user answers a question" do
  let(:question) do
    Question.create(
    title: "What am I? What have I done? Where am I? Who will answer me?",
    description: "What am I? Am I a person? Am I a mere robot with human-esque strength? Is it worth pondering these things? Am I attempting to meet some kind of arbitrary restraint on something"
    )
  end

  scenario "successfully answers a question" do
    question
    visit questions_path
    click_link "What am I? What have I done? Where am I? Who will answer me?"
    fill_in "Answer", with: "Verb noun whatever, here we go. Its a one two three, gunna answer your question real good. Real good. Best answer yet. Cant believe it. How good it is."
    click_button "Answer"

    expect(page).to have_content("What am I? What have I done? Where am I? Who will answer me?")
    expect(page).to have_content("Verb noun whatever, here we go. Its a one two three, gunna answer your question real good. Real good. Best answer yet. Cant believe it. How good it is.")
  end

  scenario "blows it when trying to answer a question" do
    question
    visit questions_path
    click_link "What am I? What have I done? Where am I? Who will answer me?"

    fill_in "Answer", with: "I will not even try to answer that."
    click_button "Answer"

    expect(page).to have_content("Description is too short (minimum is 50 characters)")
  end
end
