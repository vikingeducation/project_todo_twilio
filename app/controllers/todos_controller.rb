class TodosController < ApplicationController

  def index
    t1 = Todo.new( {:task => "Task One", :completion_date => nil} )
    t2 = Todo.new( {:task => "Task Two", :completion_date => Date.today} )
    t3 = Todo.new( {:task => "Task Three", :completion_date => Date.today - 19} )
    t4 = Todo.new( {:task => "Task Four", :completion_date => nil} )
    t5 = Todo.new( {:task => "Task Five", :completion_date => Date.today - 12} )
    @test_todos = [t1, t2, t3, t4, t5]

    # @todos = Todo.order(:completion_date => 'DESC')
    @new_task = Todo.new
  end


end
