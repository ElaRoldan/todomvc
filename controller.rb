require_relative "model.rb"
require_relative "view.rb"


class Controller
  def initialize(task)
    @model = Record.new 
    @view = View.new
    options(task)
  end  
  #Metodo que establece los comandos que admite el programa
  def options(actions)
    option = actions[0]
    task = actions[1..-1].join(" ")
    case option
      when "create" then create(task)
      when "display" then display
      when "add" then add_task(task) 
      when "delete" then delete(task)  
      when "complete" then complete(task)
      when "prioritize" then prioritize(task) 
    end   
  end 

  def create(task)
    new_task = Task.new(task)
    @model.create_csv(new_task) 
    @view.add_task(task)
  end

  def display 
    tasks = @model.show_info
    @view.display(tasks)
  end  

  def delete(num)
    task_library = @model.show_info
    new_array_to_save = @model.delete(num, task_library)
    @model.save_info(new_array_to_save[1])
    @view.delete(new_array_to_save[0])
    @view.display(new_array_to_save[1])
  end   

  def complete(num)
     task_list = @model.show_info  
     completed_list = @model.complete(num, task_list)
     @view.display(completed_list) 
  end  

  def prioritize(num)
    task_prioritary = @model.show_info
    list_prioritary = @model.prioritize(num, task_prioritary)
    @view.display(list_prioritary)
    
  end   

end 




input = ARGV 
Controller.new(input)


