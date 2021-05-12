
Rate My STYLIST APP

MAY 7
1. created project files 
2. created github repo
3. first commit
4. gem 'pry', gem 'dotenv' added


<MODEL>
USER

has_many :userstylists
has_many :stylists, through: :userstylists


UserStylist




STYLIST



### What to add ###
* welcome page  
1. button for Oauth 
<div class="github-button">
  <%= login_with_github %>
</div>

omniauth console:

request.env['omniauth.auth']
pp request.env['omniauth.auth']