class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def associate_answer
    @question = Question.find(params[:question_id])
    answer = Answer.find(params[:question_answer][:answer_id])
    question_answer = @question.question_answers.build(answer: answer)
    if question_answer.save
      flash[:notice] = "Resposta associada com sucesso"
    else
      flash[:notice] = "Ocorreu um erro"
    end
    redirect_to question_path(@question)
    authorize @question
  end

  def remove_answer
    @question = Question.find(params[:question_id])
    answer = Answer.find(params[:answer_id])
    question_answer = @question.question_answers.find_by(answer: answer)
    if question_answer.destroy
      flash[:notice] = "Resposta desassociada com sucesso"
    else
      flash[:notice] = "Ocorreu um erro"
    end
    redirect_to question_path(@question)
    authorize @question
  end

  def show
    @question_answer = QuestionAnswer.new(question: @question)
  end

  def index
    @questions = policy_scope(Question)
  end
 
  def new
    @question = Question.new
    authorize @question
  end

  def create
    final_params = question_params
    final_params[:typed_texts] = final_params[:typed_texts].split(';;')
    @question = Question.new(final_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @question.update(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:typed_texts)
  end

  def set_question
    @question = Question.find(params[:id])
    authorize @question
  end
end
