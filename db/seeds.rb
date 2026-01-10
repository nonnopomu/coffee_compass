
Branch.delete_all
Question.delete_all
Result.delete_all

results = {
  honduras: "ホンデュラス",
  guatemala: "グアテマラ",
  brazil: "ブラジル",
  colombia: "コロンビア",
  ethiopia: "エチオピア",
  rwanda: "ルワンダ",
  kenya: "ケニア",
  ethiopia_natural: "エチオピア（ナチュラル）"
}.transform_values { |country| Result.create!(country: country) }

questions = {
  q1: "酸味が少ないほうが好み？",
  q2: "穏やかな味が好み？",
  q3: "甘さがしっかりほしい？",
  q4: "果実感が好み？",
  q5: "果実感が好み？",
  q6: "軽い味わいが好み？",
  q7: "ベリー感が好き？"
}.transform_values { |text| Question.create!(text: text) }

branches = [
  [ :q1, :yes, :q2, nil ],
  [ :q1, :no,  :q5, nil ],
  [ :q2, :yes, :q3, nil ],
  [ :q2, :no,  :q4, nil ],
  [ :q3, :yes, nil, :guatemala ],
  [ :q3, :no,  nil, :honduras ],
  [ :q4, :yes, nil, :colombia ],
  [ :q4, :no,  nil, :brazil ],
  [ :q5, :yes, :q6, nil ],
  [ :q5, :no,  :q7, nil ],
  [ :q6, :yes, nil, :ethiopia ],
  [ :q6, :no,  nil, :rwanda ],
  [ :q7, :yes, nil, :ethiopia_natural ],
  [ :q7, :no,  nil, :kenya ]
]

branches.each do |q_id, answer, next_q_id, result_id|
  Branch.create!(
    question: questions.fetch(q_id),
    answer: answer,
    next_question: next_q_id ? questions.fetch(next_q_id) : nil,
    result: result_id ? results.fetch(result_id) : nil
  )
end
