require "rails_helper"
# As a user
# I want to view recently posted questions
# So that I can help others
#
# Acceptance Criteria
#
# [x] I must see the title of each question
# [x] I must see questions listed in order, most recently posted first

feature "user views a list of questions" do
  let(:question) do
    Question.create(
    title: "What am I?",
    description: "What am I? Am I a person?"
    )
  end
  let(:question_2) do
    Question.create(
    title: "Whats the jambaroo?",
    description: "Seriously, whats the ja roo ka boo?"
    )
  end

  scenario "see's all questions" do
    question
    question_2
    visit questions_path

    expect(page).to have_content("What am I?")
    expect(page).to have_content("Whats the jambaroo?")
    expect("Whats the jambaroo?").to appear_before("What am I?")
  end
end
