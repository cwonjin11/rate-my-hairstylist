<%= form_with model: @user_stylist do |f| %> 
   Who was your hairstylist ?
   <%= f.collection_select :stylist_id, Stylist.order('created_at DESC').all, :id, :name, 
    {:prompt => true} %> <br> </li>

       or→ <%= link_to "🤯Create a New Hair Stylist🤯", new_stylist_path %> <br><br>
       <br>

   <!-- <h3> or create a new hairstylist </h3>
    <%= f.fields_for :stylist_attributes  do |ff| %>
                <%= ff.label :name %>
                <%= ff.text_field :name %><br>
                <%= ff.label :phone %>
                <%= ff.text_field :phone %><br>
                <%= ff.label :shop_name %>
                <%= ff.text_field :shop_name %><br>
                <%= ff.label :address %>
                <%= ff.text_field :address %><br>
         <% end %><br> -->


<br>
        <%= f.label :haircut_date, "What date did you get your hair cut? " %>
        <%= f.date_field :haircut_date %><br>
        <%= f.label :rating, "Let's rate your hair stylist! " %>
        <%= f.select(:stars, options_for_select([
            ["⭐️", 1],
            ["⭐️⭐️", 2],
            ["⭐️⭐️⭐️", 3],
            ["⭐️⭐️⭐️⭐️", 4],
            ["⭐️⭐️⭐️⭐️⭐️", 5]
            ])) %> <br>
        <%= f.label :services, "men's haircuts? women's hair cut? kids? perm? dying? " %>
        <%= f.text_field :services %><br>
        <%= f.label :price, "How much did you pay for? " %>
        <%= f.number_field :price, step: :any %><br><br>
        <%= f.label :comment, "Please share your experience! " %>
        <%= f.text_area :comment %><br>
    


    
        <br><br>

            <%= f.submit "💈 Create this Review 💈" %>

        <br><br>


</ul>
<% end %>



<!-- 
<%= form_with model: @user_stylist do |f| %>
<%= f.label "haircut date" %><br>
<%= f.date_field :haircut_date %><br>
<%= f.label "stars out of 5" %><br>
<%= f.number_field :stars, within: 1...6 %><br>
<%= f.label "comment your hair stylist" %><br>
<%= f.text_area :comment %><br>
<%= f.label "services" %><br>
<%= f.text_field :services %><br>
<%= f.label "price" %><br>
<%= f.number_field :price, step: :any %><br><br>

<%= f.submit "Create Your Review"  %>
<% end %> -->