class Api::V1::ChatsController < Api::V1::BaseController
  def get_question
    if params[:id] == "initialize_chat"
      @question = Question.first
    else
      @question = Question.find(params[:id])
    end
    render json: @question, include: :answers
  rescue => e
    render json: { error: e}
  end
end