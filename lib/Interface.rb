require_relative "./Door"

class Interface
  def option(door)
    puts "What do you want to do with it?
      A. write an inscription on the door.
      B. open the door.
      C. close the door.
      D. lock the door.
      E. Unlock the door.
      F. Exit the world."
    choice = gets.chomp.upcase
    while true
      case choice
      when "A"
        puts "Please type the inscription to write on the door."
        inscription = gets.chomp
        write(door,inscription)
        break
      when "B"
        open(door)
        break
      when "C"
        close(door)
        break
      when "D"
        lock(door)
        break
      when "E"
        unlock(door)
        break
      when "F"
        exit
      else
        puts "Your choice is invalid. Please enter again."
      end
    end
  end

  def write(door,inscription)
    begin
      door.write(inscription)
    rescue Door::InscriptionIsNotString
    # Unlikely to happen because inscription's value retruned from gets method, which should always be a String.
      puts "You can not pass a non-string inscription."
    rescue Door::EmptyInscriptionError
      puts "You can not write an empty inscription on door. It's invalid."
    rescue Door::HasInscriptionError
      puts "The door has an inscription on it already. You can not write again."
    end
  end

  def open(door)
    begin
      door.open
    rescue Door::IsOpenError
      puts "The door is already open. You can not open it again."
    rescue Door::IsLockedError
      puts "The door is locked. You can not open it."
    end
  end

  def close(door)
    begin
      door.close
    rescue Door::IsClosedError
      puts "The door is already closed. You can not close it again."
    end
  end

  def lock(door)
    begin
      door.lock
    rescue Door::IsOpenError
      puts "You can not lock an open door without closing it first."
    rescue Door::IsLockedError
      puts "The door is already locked. You can not lock it again."
    end
  end

  def unlock(door)
    begin
      door.unlock
    rescue Door::IsUnlockedError
      puts "The door is already unlocked. You can not unlocked it again."
    end
  end

  def show_status(door)
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
  end

  def play(door)
    puts "Welcome to this world. There is a door in front of you."
    show_status(door)
    while true
      option(door)
      puts "Great. Let's look at the door again:"
      show_status(door)
    end
  end
end
