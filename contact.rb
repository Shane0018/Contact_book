class Contact

  @@contacts = []
  @@id = 1 

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email   
    @note = note 
    # @@list_of_contacts << self 
    @id = @@id 
    @@id += 1 
  end

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts 
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id 
    return contact
      end 
    end 
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(key, value)
    if key == "first_name"
      @first_name = value
    elsif key == "last_name"
      @last_name = value
    elsif key == "email"
      @email = value
    elsif key == "note"
      @note = value
    else 
      return "no such attribute"
    end 
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(key, value)
    @@contacts.each do |contact| 
      if key == "first_name" && contact.first_name == value  
        return contact
      elsif key == "last_name" && contact.last_name == value
        return contact
      elsif key == "email" && contact.email == value
        return contact
      elsif key == "note" && contact.note == value
        return contact
      else 
        return "not found" 
      end 
    end 
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = [] 
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self) 
    # position = @id - 1
    # contact = @@contacts[position]
    # @@contacts.delete(contact) 
  end

  # Feel free to add other methods here, if you need them.
  
end

p betty = Contact.create("Betty", "Maker", "bettymaker@gmail.com", "loves Pokemon")

#  # p contact.id 
p bill = Contact.create("Bill", "Hodger", "billhodger@gmail.com", "has phd in nature")
# p bill.update("first_name", "Joe") 
# p bill 
# p Contact.all 
# p Contact.find_by("first_name", "Betty") 

# # Contact.delete_all 
# p bill.full_name

# bill.update("note", "updated note!") 
# bill.delete 
# p Contact.all 


