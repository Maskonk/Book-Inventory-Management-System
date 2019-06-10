require_relative '../models/book'
require_relative '../models/author'

require 'pry-byebug'

Book.delete_all
Author.delete_all


author1 = Author.new({'first_name'=>'Robert', 'last_name'=>'Muchamore'})
author1.save

author2 = Author.new({'first_name'=>'Wizards of the Coast', 'last_name'=>''})
author2.save

book1 = Book.new({'name'=>'The General', 'description'=>'Tenth book in the Cherub series.', 'quantity'=>5,
                  'buying_cost'=>6.00, 'selling_cost'=>7.20, 'author_id'=>author1.id})
book1.save

book2 = Book.new({'name'=>'The Recruit', 'description'=>'First book in the Cherub series.', 'quantity'=>7,
                  'buying_cost'=>7.99, 'selling_cost'=>10.99, 'author_id'=>author1.id})
book2.save

book3 = Book.new({'name'=>'Guildmasters guide to Ravnica', 'description'=>'A book designed to bring D&D campaigns into the MTG Universe',
                  'quantity'=>3, 'buying_cost'=>10.99, 'selling_cost'=>29.99, 'author_id'=>author2.id})
book3.save

binding.pry
nil