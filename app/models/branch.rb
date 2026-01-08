class Branch < ApplicationRecord
  enum answer: { no: 0, yes: 1 }

  validates :answer, presence: true

  belongs_to :question
  belongs_to :result, optional: true
  belongs_to :next_question, class_name: "Question", optional: true

  # 次の質問か結果のどちらかは必須であるバリデーションを追加予定
end
