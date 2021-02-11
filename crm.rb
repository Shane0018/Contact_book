require_relative 'contact'
class CRM

  def initialize
    
  end

  def main_menu
    while true # repeat indefinitely
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
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit 
    end 
  end

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp 
    print "Enter a Note: "
    note = gets.chomp 
    contact = Contact.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      note: note
    )
  end

  def modify_existing_contact
    print "Enter the ID of the Contact You Wish to Modify: "
    user_input = gets.chomp 
    id = user_input.to_i 
    contact_to_be_modified = Contact.find(id)
    print "Enter Attribute You Wish to Change: (print '1' for first_name, '2' for last_name, '3' for email, '4' for note): "
    key = gets.chomp.to_i 
    case key 
    when 1 then key = "first_name"
    when 2 then key = "last_name"
    when 3 then key = "email"
    when 4 then key = "note"
    end 
    print "Enter New Value of Attribute: "
    value = gets.chomp 
    contact_to_be_modified.update(key => value)
  end

  def delete_contact
    print "Enter the ID of the Contact You Wish to Delete: "
    id = gets.chomp.to_i 
    contact_to_be_deleted = Contact.find(id) 
    contact_to_be_deleted.delete 
  end

  def display_all_contacts
    p Contact.all 
  end

  def search_by_attribute
    print "Enter the Attribute You Wish to Search By: (first_name, last_name, email, note): "
    attribute_to_be_searched_by = gets.chomp 
    print "Enter the Value of the Attribute You Wish to Search By: "
    value_of_attr_to_be_searched_by = gets.chomp 
    contact = Contact.find_by(attribute_to_be_searched_by => value_of_attr_to_be_searched_by)
    p contact 
  end

end

at_exit do 
  ActiveRecord::Base.connection.close
end 

a_crm_app = CRM.new 
a_crm_app.main_menu

