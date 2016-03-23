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

  scenario "see's all questions" do
    question
    question_2
    visit questions_path

    expect(page).to have_content("What am I? What have I done? Where am I? Who will answer my questions?")
    expect(page).to have_content("Whats the jambaroo Mr.Samboro, a koro you say? Cannot be. Yes?")
    save_and_open_page
    expect("Whats the jambaroo Mr.Samboro, a koro you say? Cannot be. Yes?").to appear_before("What am I? What have I done? Where am I? Who will answer my questions?")
  end
end
