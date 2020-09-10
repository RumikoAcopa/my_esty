class User < ActiveRecord::Base 
    #now I have a ruby class that represents users
    has_secure_password
    has_many :account
end
#<label for="name">Cleanser</label>
#<input type="text" name="name" id="name" />
#<option value="Oil">Oil</option>
#<label for="name">Size</label>
#<input type="text" name="size" id="size" />
#<label for="name">description</label>
#<input type="text" name="description" id="description" />
#<input type="submit" name="submit" value="Create Product" />