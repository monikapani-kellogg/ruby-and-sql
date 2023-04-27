# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

puts "There are #{Company.all.count} companies"

# 2. insert new rows in companies table

new_company = Company.new
puts new_company
puts new_company.inspect

new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "California"
new_company["url"] = "https://www.apple.com"
new_company.save # insert into the table

puts new_company.inspect

puts "There are #{Company.all.count} companies" #ID is going to be incremented everytime you run this code since destroy_all deletes all rows first and recreating a new row updated id

company_2 = Company.new

company_2["name"] = "Amazon"
company_2["city"] = "Seattle"
company_2["state"] = "Washington"
company_2.save # insert into the table

puts company_2.inspect

puts "There are #{Company.all.count} companies" #ID is going to be incremented everytime you run this code since destroy_all deletes all rows first and recreating a new row updated id


company_3 = Company.new

company_3["name"] = "Twitter"
company_3["city"] = "San Francisco"
company_3["state"] = "California"
company_3["url"] = "https://www.twitter.com"
company_3.save # insert into the table

puts company_3.inspect

puts "There are #{Company.all.count} companies" #ID is going to be incremented everytime you run this code since destroy_all deletes all rows first and recreating a new row updated id

all_companies = Company.all #returns an array, we can do all array things on this
# puts all_companies.inspect


# 3. query companies table to find all row with California company

cali_companies = Company.where({"state" => "California"})
puts cali_companies.inspect

puts "CA companies: #{cali_companies.count}"

# 4. query companies table to find single row for Apple

# apple = Company.where({"name" => "Apple"}) # remember this always returns an array
apple = Company.find_by({"name" => "Apple"}) 
puts apple.inspect
puts apple["url"]

# 5. read a row's column value

amazon = Company.find_by({"name" => "Amazon"}) 
puts amazon.inspect
puts amazon["url"]

# 6. update a row's column value

amazon["url"] = "https://www.amazon.com"
amazon.save #update row in table

all_companies = Company.all #returns an array, we can do all array things on this
puts all_companies.inspect



# 7. delete a row

twitter = Company.find_by({"name"=> "Twitter"})
twitter.destroy

puts "There are #{Company.all.count} companies" 