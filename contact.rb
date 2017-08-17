class Contact

  @@contact = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1 #this way the next contract will get a different id end
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contact << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contact
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contact.each {|contact|
      if contact.id_reader == id
        return contact
      end
    }
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    if attribute == "first_name"
      @first_name = value
    elsif attribute == "last_name"
      @last_name = value
    elsif attribute == "email"
      @email = value
    elsif attribute == "notes"
      @notes = value
    end



  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  # def self.find_by(attribute_reader_method, attribute_value)
  #   @@contact.each {|contact|
  #     if contact.attribute_reader_method == attribute_value
  #       return contact
  #     end
  #   }
  # end

 def self.find_by(searchby, searchfor)
   # searchby is a method to be applied to each element of the @@contacts array; it's applied with the .send method.
   # select outputs an array of values (in this case, as we iterate through @@contacts, an array of Contact objects) for which the given condition is true. the given condition is each_contact.searchby == searchfor
   @@contact.each do |each_contact|
    if (each_contact.send(searchby)) == searchfor
      return each_contact
   end
  end
 end

  # This method should delete all of the contacts
  def self.delete_all
    @@contact = []
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contact.delete(self)
  end

  # Feel free to add other methods here, if you need them.

  # a getter (the value of an attribute)
  def email_reader
    @email
  end

  def id_reader
    @id
  end

  def first_name_reader
    @first_name
  end

  def last_name_reader
    @last_name
  end

  def note_reader
    @note
  end
  #a setter (the value of an attribute)
  def note=(note)
    @note = note
  end

  def self.contact_array_reader
    @@contact
  end
end


james = Contact.create("james", "bay", "jj", "likes cats")

p Contact.find_by("first_name_reader", "james")

p Contact.contact_array_reader
#
# Contact.delete_all

p Contact.contact_array_reader

p james.full_name

Contact.delete_all

p Contact.contact_array_reader

james = Contact.create("james", "bay", "jj", "likes cats")

bob = Contact.create("bob", "bay", "jj", "likes cats")

p Contact.contact_array_reader

bob.delete
p "--------------------------"
p Contact.contact_array_reader
