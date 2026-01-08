class TestsController < ApplicationController
  def start
    session[:answers] = []
    # 作成順でとってるから要改善
    first_question = Question.first
    redirect_to test_path(first_question)
  end

  def show
    @question = Question.find(params[:id])
    @branches = @question.branches
  end

  def answer
    question = Question.find(params[:id])
    answer = params[:answer]

    branch = question.branches.find_by!(answer: answer)

    session[:answers] ||= []
    session[:answers] << { question_id: question.id, answer: answer }

    if branch.next_question
      redirect_to test_path(branch.next_question)
    else
      redirect_to result_test_path(branch.result)
    end
  end

  def back
    session[:answers] ||= []
    last = session[:answers].pop

    if last
      prev_question = Question.find(last[:question_id])
      redirect_to test_path(prev_question)
    else
      redirect_to start_tests_path
    end
  end

  def result
    @result = Result.find(params[:id])
  end
end
