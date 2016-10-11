class View
  def initialize
    

  end   
  
  def display(tasks)
    #Genero un arreglo con los valores a desplegar en la lista de tareas
    activities = []
    task_number = []
    activity_status_for_display = []
    tasks.each_with_index {|task, index|  activities << task.task_name } 
    tasks.each_with_index {|task, index| task_number << index + 1 } 
    
    tasks.each do |task|
      task.done == "true" ? activity_status_for_display << "[ x ]" : activity_status_for_display << "[   ]"
    end   
    #Da formato a como se visualiza la lista de tareas 
    p "Lista de actividades"
    p "-"*60
    p " #   status   actividad" 

    #Repite el formato para cada una de las tareas listadas 
    repeat = activities.count 
    num = 0 
    until num == repeat
      p "#{task_number[num]}    #{activity_status_for_display[num]}    #{activities[num]}"   
      puts
      num += 1  
    end
   end
   
  def add_task(task)  
    p "-"*60
    puts "Agregaste la tarea: #{task} a tu lista"
  end  

  def delete(task)
    p "-"*60
    puts "Eliminaste la tarea: #{task} de tu lista."
  
  end 

  

end 