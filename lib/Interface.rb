require_relative "./Door"

class Interface
  # def self.option
  #   puts "What do you want to do with it?
  #     A. write an inscription on the door.
  #     B. open the door.
  #     C. close the door.
  #     D. lock the door.
  #     E. Unlock the door."
  #   choice = gets.chomp.upcase
  #   while true
  #     case choice
  #     when "A"
  #       puts "Please type the inscription to write on the door."
  #         inscription = gets.chomp
  #       door.write(inscription)
  #       break
  #     when "B"
  #       door.open
  #       break
  #     when "C"
  #       door.close
  #       break
  #     when "D"
  #       door.lock
  #       break
  #     when "E"
  #       door.unlock
  #       break
  #     else
  #       puts "Your choice is invalid. Please enter again."
  #     end
  #   end
  # end

  door = Door.new
  puts "Welcome to this world. There is a door in front of you."
  if door.inscription.class == String && door.inscription.size > 0
    puts "The inscription on the door is #{door.inscription}"
  end

  if door.is_open == true
    door_status = "OPEN"
  else
    door_status = "CLOSED"
  end
  if door.is_locked == true
    door_lock = "LOCKED"
  else
    door_lock = "UNLOCKED"
  end

  puts "The door is currently #{door_status} and #{door_lock}."
  puts "What do you want to do with it?
    A. write an inscription on the door.
    B. open the door.
    C. close the door.
    D. lock the door.
    E. Unlock the door."
  choice = gets.chomp.upcase
  while true
    case choice
    when "A"
      puts "Please type the inscription to write on the door."
        inscription = gets.chomp
      door.write(inscription)
      break
    when "B"
      door.open
      break
    when "C"
      door.close
      break
    when "D"
      door.lock
      break
    when "E"
      door.unlock
      break
    else
      puts "Your choice is invalid. Please enter again."
    end
  end
  puts "Great. Let's look at the door again:"
  if door.inscription.class == String && door.inscription.size > 0
    puts "The inscription on the door is #{door.inscription}"
  end
  puts "The door is currently #{door_status} and #{door_lock}."

  while true
    puts "Do you want to do something else about the door?(Y/N)"
    choice_2 = gets.chomp.upcase
    if choice_2 == "Y"
      puts "What do you want to do with it?
        A. write an inscription on the door.
        B. open the door.
        C. close the door.
        D. lock the door.
        E. Unlock the door."
      choice = gets.chomp.upcase
      while true
        case choice
        when "A"
          puts "Please type the inscription to write on the door."
            inscription = gets.chomp
          door.write(inscription)
          break
        when "B"
          door.open
          break
        when "C"
          door.close
          break
        when "D"
          door.lock
          break
        when "E"
          door.unlock
          break
        else
          puts "Your choice is invalid. Please enter again."
        end
      end
      puts "Great. Let's look at the door again:"
      if door.inscription.class == String && door.inscription.size > 0
        puts "The inscription on the door is #{door.inscription}"
      end
      if door.is_open == true
        door_status = "OPEN"
      else
        door_status = "CLOSED"
      end
      if door.is_locked == true
        door_lock = "LOCKED"
      else
        door_lock = "UNLOCKED"
      end
      puts "The door is currently #{door_status} and #{door_lock}."
    elsif choice_2 == "N"
      exit
    else
      puts "I do not understand your choice. Please enter again."
    end
  end
end

Interface.new
