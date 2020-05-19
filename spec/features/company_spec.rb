  
require "rails_helper"

describe "Company" do
  it "has an underlying table", points: 1 do
    company_migrations_exists = false
    
    if ActiveRecord::Base.connection.table_exists? "companies"
      company_migrations_exists = true
    end
    expect(company_migrations_exists).to be(true),
      "Expected there to be a migration for the table but didn't find one."
  end
end

describe "Company" do
  it "has a class that is connected to a table", points: 2 do
    expect{ Company }.to_not raise_error(NameError)
    expect{ Company }.to_not raise_error(LoadError)
  end
end

describe "Company" do
  it "inherits from ApplicationRecord", points: 1 do
    expect(Company).to be < ApplicationRecord
  end
end

describe "Company" do
  it "has an attribute called name", points: 1 do
    new_company = Company.new
    expect(new_company.attributes).to include("name"),
      "Expected Company object to have an attr_accessor called 'name' but didn't."
  end
end

describe "Company" do
  it "has an attribute called name that is type String", points: 1 do
    new_company = Company.new
    expect(Company.column_for_attribute('name').type).to be(:string)
  end
end
