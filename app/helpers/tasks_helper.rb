module TasksHelper

	def task_params

  	params.require( :task ).permit(:description, :date )

	end

end
