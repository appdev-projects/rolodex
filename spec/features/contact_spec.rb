require "rails_helper"

describe "Contact" do
  it "has an underlying table", points: 1 do
    contact_migrations_exists = false
   
    if ActiveRecord::Base.connection.table_exists? "contacts"
      contact_migrations_exists = true
    end
    expect(contact_migrations_exists).to be(true)
  end
end

describe "Contact" do
  it "has a class that is connected to a table", points: 2 do
    expect{ Contact }.to_not raise_error(NameError)
    expect{ Contact }.to_not raise_error(LoadError)
  end
end

describe "Contact" do
  it "inherits from ApplicationRecord", points: 1 do
    expect(Contact).to be < ApplicationRecord
  end
end

describe "Contact" do
  it "has an attribute called 'first_name'", points: 1 do
    new_contact = Contact.new
    expect(new_contact.attributes).to include("first_name")
  end
end

describe "Contact" do
  it "has a column called 'date_of_birth' that is type Date", points: 1 do
    expect(Contact.column_for_attribute("date_of_birth").type).to be(:date)
  end
end
