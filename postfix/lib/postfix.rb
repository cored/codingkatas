module PostFix

  def infix
    remove_parenthesis = self.gsub(/(|)/,'')
    numbers = remove_parenthesis.split(/\D+/).join ' '
    operators = remove_parenthesis.split(/\d+|\(|\)|\s+/).reverse.join ''
    "#{numbers}#{operators}".strip
  end

end
