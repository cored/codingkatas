module Replacer

  def evaluate(attributes)
    raise ReplacerError unless attributes_include_variable?(attributes)
    attributes.reduce("") do |repl,kv| 
      self.gsub!(regex(kv[0]), kv[1])
    end
  end

  private 
  def regex(value)
    /{\$#{value}}/
  end

  def attributes_include_variable?(attributes)
    attributes.keys.any? { |var| self.include? var } 
  end

end

class ReplacerError < Exception; end
