class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order('created_at DESC')
    # @answer = Answer.all.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "You have successfully posted a question!"
      redirect_to @question
    else
      flash[:notice] = "#{@question.errors.full_messages.first}"
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = "You have successfully updated your question!"
      redirect_to @question
    else
      flash[:notice] = "#{@question.errors.full_messages.first}"
      render 'edit'
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
