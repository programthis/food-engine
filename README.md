# Environment Setup:
Installing rvm (highly recommended) and rails:    
`gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`    
`\curl -sSL https://get.rvm.io | bash -s stable --rails`    

# Installation Instructions:

`cd food-engine`     
`bundle install`      
`rails db:setup`     
`rails s --port 2000`     

# Logging in on local development:

As there is not an smtp server set up for local development, when you first sign up it won't send an email with the confirmation link. Instead, you can find the link in the server logs. Simply copy and paste the link into a browser and this will confirm your email address.

# Setting admin user:
For certain functionality (adding new food, recipe etc), you will need to update the user account so that it is an admin. To do so, simply login to the rails console, change the attribute, and save it.

`rails c`     
`u=User.first`     
`u.admin=true`     
`u.save`     

# Updating credentials:

As you don't want to be commiting access keys, logins, or generally anything you would want to remain a secret, you should be modifying the encrypted credentials.yml.enc file. To modify this file, type the below:    
`EDITOR="subl --wait" rails credentials:edit`     

When you are finished, simply close the file and it will be encrypted again.

# Postgres troubleshooting:

If you are on a mac, installing postgres should be relatively easy. If postgres does not successfully install through the bundle command, you can use:     
`brew install postgres`

On linux, the process is a bit more involved:     
`sudo apt-get install postgresql`

Starting the server on linux:     
`pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start`
