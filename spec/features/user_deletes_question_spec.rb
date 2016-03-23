# As a user
# I want to delete a question
# So that I can delete duplicate questions
#
# Acceptance Criteria
#
# [] I must be able delete a question from the question edit page
# [x] I must be able delete a question from the question details page
# [x] All answers associated with the question must also be deleted

feature "user deletes a question" do
  let(:question) do
    Question.create(
    title: "What am I? What have I done? Where am I? Who will answer my questions?",
    description: "What am I? Am I a person? Am I a mere robot with human-esque strength? Is it worth pondering these things? Am I attempting to meet some kind of arbitrary restraint on something"
    )
  end
  let(:question_2) do
    Question.create(
    title: "Whats the jambaroo Mr.Samboro, a koro you say? Cannot be. Yes?",
    description: "Seriously, whats the ja roo ka boo a do a do a do a dew. I bid you adieu? Ok did I though? Did I? Huh? Eh? Even longer? Ok here we go. Too many questions?"
    )
  end

  scenario "deletes a question from details page" do
    question
    question_2
    visit questions_path
    click_on question.title
    click_on "Destroy"

    expect(page).to have_content(question_2.title)
    expect(page).to_not have_content(question.title)
  end

  scenario "deletes a question from the edits page" do
    question
    question_2
    visit questions_path
    click_on question_2.title
    click_on "Edit"
    click_on "Destroy"

    expect(page).to have_content(question.title)
    expect(page).to_not have_content(question_2.title)
  end
end
