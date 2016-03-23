# As a user
# I want to view the answers for a question
# So that I can learn from the answer
#
# Acceptance Criteria
#
# [] I must be on the question detail page
# [] I must only see answers to the question I'm viewing
# [] I must see all answers listed in order, most recent last

feature "user views answers" do
  let(:question) do
    Question.create(
    title: "What am I? What have I done? Where am I? Who will answer me?",
    description: "What am I? Am I a person? Am I a mere robot with human-esque strength? Is it worth pondering these things? Am I attempting to meet some kind of arbitrary restraint on something"
    )
  end

  let(:answer) do
    Answer.create(
    description: "Youve done nothing, you are nothing, this is getting down real fast. Sorry about that. Youre great, awesome, I could have answered this far more swiftly if there werent these darn validations, also no escape characters allowed"
    )
  end

  let(:answer_2) do
    Answer.create(
    description: "In the tiki tiki tiki tiki tiki room, In the tiki tiki tiki tiki tiki room, In the tiki tiki tiki tiki tiki room"
    )
  end


  scenario "views an answer" do
    question
    visit questions_path
    click_link question.title
    fill_in "Answer", with: answer.description
    click_button "Answer"
    fill_in "Answer", with: answer_2.description
    click_button "Answer"


    expect(page).to have_content(question.title)
    expect(page).to have_content(answer.description)
    expect(page).to have_content(answer_2.description)
    expect(answer_2.description).to appear_before(answer.description)


  end
end
