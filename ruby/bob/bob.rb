class AnswerForQuestion
  def initialize(question)
    @question = question
  end

  def respond
    'Sure.' if can_handle?
  end

  private
  def can_handle?
    @question.end_with? '?'
  end
end

class AnswerForYelling

  def initialize(question)
    @question = question
  end


  def respond
    'Woah, chill out!' if can_handle?
  end

  private
  def can_handle?
    @question == @question.upcase
  end
end

class AnswerForNothing

  def initialize(question)
    @question = question
  end


  def respond
    'Fine. Be that way!' if can_handle?
  end

  private 
  def can_handle?
    @question.nil? or @question.empty?
  end
end

class Bob
  ANSWERS = [
    AnswerForQuestion,
    AnswerForYelling,
    AnswerForNothing
  ]

  def hey(got_told)
    response = ''
    ANSWERS.each do |handle_answer|
      response = handle_answer.new(got_told).respond
    end
    'Whatever.' || response
  end

end

