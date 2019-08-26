class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @answers = policy_scope(Answer)
  end
 
  def new
    @answer = Answer.new
    authorize @answer
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to answers_path
    else
      render :new
    end
    authorize @answer
  end

  def edit
  end

  def update
    @answer.update(answer_params)
    if @answer.save
      redirect_to answers_path
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_path
  end

  private
  def answer_params
    params.require(:answer).permit(:text, :image, :next_question_id, :final_path)
  end

  def set_answer
    @answer = Answer.find(params[:id])
    authorize @answer
  end
end
