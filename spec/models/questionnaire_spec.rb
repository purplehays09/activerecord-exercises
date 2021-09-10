require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  def build_questionnaire
    Questionnaire.create!(title: 'Test Questionnaire')
  end

  def build_question
    Question.new(title: "Question #{rand(1..999)}")
  end

  def build_answer
    Answer.new(label: "Answer #{rand(1..999)}")
  end

  def create_response(attrs = {})
    Response.create!(attrs)
  end

  it "creates a questionnaire" do
    questionnaire = build_questionnaire
    expect(questionnaire.title.split(' ')[0]).to eq("Test") 
  end

  it "adds questions to questionnaire" do
    questionnaire = build_questionnaire
    3.times { questionnaire.questions << build_question }
    expect(questionnaire.questions.count).to eq(3) 
  end
  
  it "adds answers to questions" do
    questionnaire = build_questionnaire
    questionnaire.questions << question = build_question
    3.times { question.answers << build_answer }
    expect(question.answers.count).to eq(3) 
  end

  it "question can be answered" do
    questionnaire = build_questionnaire
    questionnaire.questions << question = build_question
    question.answers << answer = build_answer
    response = create_response(answer: answer)

    expect(answer.responses).to eq([response]) 
  end
  
  it "responses can be accessed for a question" do
    questionnaire = build_questionnaire
    questionnaire.questions << question = build_question
    3.times { question.answers << build_answer }
    10.times { create_response(answer: question.answers.sample) }

    expect(question.responses.count).to eq(10) 
  end

  it "responses can be accessed for a questionnaire" do
    questionnaire = build_questionnaire
    questionnaire.questions << question = build_question
    3.times { question.answers << build_answer }
    10.times { create_response(answer: question.answers.sample) }

    expect(questionnaire.responses.count).to eq(10) 
  end
  
  

end
