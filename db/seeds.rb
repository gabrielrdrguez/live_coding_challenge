# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@users = %w[Fulano Ciclano Beltrano]
           .map { |name| User.create(name: name) }

@subjects = %w[Matematica Portugues Redacao].map { |name| Subject.create(name: name) }

@questions = @subjects.each_with_object({}) do |subject, hash|
  hash[subject.id] = [Question.create(subject: subject, right_answer: 'A'),
                      Question.create(subject: subject, right_answer: 'B'),
                      Question.create(subject: subject, right_answer: 'C')]
end

@users.first.then do |user|
  @questions.each do |_subject_id, subject_questions|
    QuestionAnswer.create(user: user, question: subject_questions.first, answer: subject_questions.first.right_answer)
    QuestionAnswer.create(user: user, question: subject_questions.second, answer: subject_questions.second.right_answer)
    QuestionAnswer.create(user: user, question: subject_questions.third, answer: subject_questions.third.right_answer)
  end
end

@users.second.then do |user|
  @questions.each do |_subject_id, subject_questions|
    QuestionAnswer.create(user: user, question: subject_questions.first, answer: subject_questions.first.right_answer)
    QuestionAnswer.create(user: user, question: subject_questions.second, answer: subject_questions.second.right_answer)
    QuestionAnswer.create(user: user, question: subject_questions.third, answer: '')
  end
end

@users.third.then do |user|
  @questions.each do |_subject_id, subject_questions|
    QuestionAnswer.create(user: user, question: subject_questions.first, answer: subject_questions.first.right_answer)
    QuestionAnswer.create(user: user, question: subject_questions.second, answer: '')
    QuestionAnswer.create(user: user, question: subject_questions.third, answer: '')
  end
end
