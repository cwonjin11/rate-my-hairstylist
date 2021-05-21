
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





<!-- 
<hr>
<h4> Highly-rated Hairstylists !! </h4>
    <ul>
        <% @more_than_4_stars.each do |review| %>
        <li><%= link_to review.name, stylist_path(review) %>  <%= review.hairstylist_rating %>
        stars </li>
        <% end %>
    </ul>
<hr> -->


<!--<%= f.collection_check_boxes :stylist_id, Stylist.all, :id, :name %>   -->

<!-- <%= f.label :stylist_name, "who was your hair stylist? " %>
<%= f.text_field :stylist_name, placeholder: @stylist.name %><br> -->


<!-- <hr>
    <h4>High-rated Reviews (more than 4 stars)</h4>
    <ul>
       <% @high_rated_hairstylists.each do |hairstylist| %>
       <li> <%=link_to hairstylist.name, stylist_path(hairstylist) %> <%= hairstylist.average_rating %> </li>
    <% end %>
    </ul>
<hr> -->



class CreateUserStylists < ActiveRecord::Migration[6.1]
  def change
    create_table :user_stylists do |t|
      t.date :haircut_date
      t.integer :stars
      t.string :comment
      t.string :services
      t.float :price
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :stylist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
