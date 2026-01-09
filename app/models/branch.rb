class Branch < ApplicationRecord
  enum answer: { no: 0, yes: 1 }

  validates :answer, presence: true
  validate :next_question_or_result

  belongs_to :question
  belongs_to :result, optional: true
  belongs_to :next_question, class_name: "Question", optional: true

  private

  def next_question_or_result
    if next_question.nil? && result.nil?
      errors.add(:base, "next_question か result は必須です")
    elsif next_question && result
      errors.add(:base, "next_question か result 片方のみです")
    end
  end

  def self.next_for(question, answer)
    question.branches.find_by!(answer: answer)
  end
end
