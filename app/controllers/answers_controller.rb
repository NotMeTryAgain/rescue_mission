class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)

    if @answer.save
      flash[:notice] = "You have successfully posted an answer"
      redirect_to question_path(@question)
    else
      flash[:notice] = "#{@answer.errors.full_messages.first}"
      render :'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:description)
    end
end
