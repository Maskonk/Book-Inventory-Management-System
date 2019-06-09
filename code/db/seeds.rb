require_relative '../models/item'
require_relative '../models/author'

require 'pry-byebug'

Item.delete_all
Author.delete_all


author1 = Author.new({'first_name'=>'Robert', 'last_name'=>'Muchamore'})
author1.save

author2 = Author.new({'first_name'=>'Wizards of the Coast', 'last_name'=>''})
author2.save

item1 = Item.new({'name'=>'The General', 'description'=>'Tenth book in the Cherub series.', 'quantity'=>5,
                  'buying_cost'=>5.99, 'selling_cost'=>19.99, 'author_id'=>author1.id})
item1.save

item1 = Item.new({'name'=>'The Recruit', 'description'=>'First book in the Cherub series.', 'quantity'=>7,
                  'buying_cost'=>5.99, 'selling_cost'=>19.99, 'author_id'=>author1.id})
item1.save

binding.pry
nil