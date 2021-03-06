require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
    p "Okay, this CRM has the name " + name

  end

  def main_menu
    while true # print indefinetly
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts_contact
    when 5 then search_by_attribute
    when 6 then abort "See Yuh"
    end
end


  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    contact = Contact.create(
  first_name: first_name,
  last_name:  last_name,
  email:      email,
  note:       note
  )

  end


  def modify_existing_contact
    p "modify"
    p "first name: "
    first_name = gets.chomp
    contact = Contact.find_by(first_name_reader, first_name)
    p "Press 1 to modify last name"
    p "Press 2 to modify first name"
    p "Press 3 to modify email"
    p "Press 4 to modify notes"
    # to be continued

  end
  #
  # def delete_contact
  #
  # end
  #
  # def display_all_contacts
  #
  # end
  #
  # def search_by_attribute
  #
  # end





end

at_exit do
  ActiveRecord::Base.connection.close
end
