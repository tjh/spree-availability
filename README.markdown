Availability Extension
======================

Similar to Amazon's "This product ships within 24 hours" or "Should ship in 4-5 days", this extension provides two messages for each product that give customers more information on the item's availability.

One message displays when the product (or an individual variant) has zero stock ("Out of stock, ships in 3-4 days", for example) and another when there is 1 or more in stock ("In stock, ships within 24 hours", for example).

Because a product may have some variants in stock and others out of stock, you can setup the product pages to display one of the two messages chosen for the product based on those stock levels.

The store can have numerous messages available for products to use.

Site Extension examples
-----------------------

### public/stylesheets/sass/site.sass ###

Add this for some basic styling

    .stock-message
      :color grey
      :padding 0px 0px 0px 22px
      :text-weight normal
  
### app/views/products/_cart_form.html.erb ###

Update this file to show the messages chosen on the product view page.

Directly after the "variant_price_diff" output (near line #27). This will display a message for each variant based on its stock level.

    <br /><span class="stock-message"><%= variant_availability v %></span>

Add an "else" to the "if @product.has_variants?" (near line #65). This is used when there are no variants (only a master).

    <% else %>
      <div class="stock-message"><%= variant_availability @product.master %></div>

### app/views/orders/_line_item.html.erb ###

Right after "truncate(variant.product.description...", add this line (around line #12)

    <div class="stock-message"><%= truncate( variant_availability( variant ), :length => 100, :omission => "...") %></div>

### app/views/shared/_order_details.html.erb ###

After the line containing "item.variant.product.name" add this line (around line #12)

    <span class="stock-message"><%= variant_availability item.variant %></span></td>

To Do
-----------------------

* TESTS! I learned a lot and tried many different scenarios as I went (http://www.thekua.com/atwork/2008/02/if-you-do-test-driven-development-all-the-time-youre-doing-something-wrong/). I would like to use Cucumber, but it seems that I'll need to do that in the context of a full Spree site.
* Setup the message table to allow multiple languages
* Consider ways to apply messages to entire blocks (categories, product types, etc) at once to speed administration
* Look into database calls and efficiency. Does the extension add uneccessary db burden?
* See if there is a way to override one of the product helpers like "variant_options" to add the availability message instead of having to edit the _cart_form.html.erb file.