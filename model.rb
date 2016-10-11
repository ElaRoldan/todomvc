require "csv"

class Task 
  attr_accessor :task_name, :done 
  def initialize(task_name, done=false)
    @task_name = task_name
    @done = done
  end   
end 

class Record

  def create_csv(task)
    CSV.open('tasks.csv', "a+") do |csv|
        csv << [task.task_name, task.done]
    end
  end  

  def show_info
    menu_display = []
    CSV.foreach("tasks.csv") do |row|
      menu_display << Task.new(row[0], row[1])
    end 
    menu_display  
  end  

  def delete(num, task_library)
    temp_library = []
    task_to_display = []
    values = []
    new_num = num.to_i 
    task_library.each_with_index do |task, index|
      if new_num != index + 1
        temp_library << task
      elsif new_num == index + 1 
        task_to_display << task            
      end   
    end
    [task_to_display[0].task_name, temp_library]   
    
  end 

  def save_info(array_to_save) 
    CSV.open("tasks.csv", "wb") do |csv|
      array_to_save.each do |task|
        csv << [task.task_name, task.done]
      end 
    end   
  end 

  def complete(num, task_list)
    num_new = num.to_i
    task_list.each_with_index do |temp_task, index|
      if index + 1 ==  num_new
        temp_task.done = true 
      end      
    end 
    save_info(task_list)
    show_info
  end   

  def prioritize(num, task_prioritary)
    n_num = num.to_i
    temp_array = []
    true_array = []
    task_prioritary.each_with_index do |task, index|
      if  index + 1 == n_num && task.done == "false" 
        temp_array.unshift(task)
      elsif  task.done == "false" 
        temp_array << task  
      elsif  task.done == "true" 
        true_array << task
      end   
    end  
    prioritized_array = (temp_array << true_array).flatten
    save_info(prioritized_array)
  end   
    
   
end




