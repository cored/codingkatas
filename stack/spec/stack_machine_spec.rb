describe StackMachine do 
  it 'should push 1 into the stack' do 
    StackMachine.new('1').emulate.should == 1 
  end

  it 'should push 1,3 into the stack' do 
    stack_machine = StackMachine.new('13')
    stack_machine.emulate
    stack_machine.stack.should == [1,3]
  end

  it 'should perform addition with 13+' do 
    StackMachine.new('13+').emulate.should == 4
  end

  it 'should return [4, 6, 2] for 13+62' do 
    stack_machine = StackMachine.new('13+62')
    stack_machine.emulate
    stack_machine.stack.should == [4,6,2]
  end

  it 'should perform multiplication' do 
    StackMachine.new('13+62*').emulate.should == 12
  end

  context 'edge cases' do 
    it 'should return 76 for 13+62*7+*' do 
      StackMachine.new('13+62*7+*').emulate.should == 76
    end

    it 'should return -1 for overflow' do 
      StackMachine.new('11++').emulate.should == -1
    end

    it 'should return -1 for empty stack' do 
      StackMachine.new('').emulate.should == -1
    end
  end
end
