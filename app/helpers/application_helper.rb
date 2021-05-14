module ApplicationHelper

 #### for O review ####
      def pluralize_without_count(count, noun, text = nil)
        if count != 0 
            count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
        end
      end

     # <%= pluralize_without_count(@stylist.user_stylists.count, 'review', ':') %>

end
