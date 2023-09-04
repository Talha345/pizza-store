require "application_system_test_case"

class OrdersControllerTest < ApplicationSystemTestCase

  test "should display orders on index page" do
    order1 = orders(:one)
    order2 = orders(:two)
    order3 = orders(:three)

    visit root_path

    # Check that there are exactly three divs with class 'order' on the page
    assert_selector "div.order", count: 3

    # Check if all three orders are displayed on the page by matching the UUIDs
    assert_text order1.uuid
    assert_text order2.uuid
    assert_text order3.uuid
  end

  test "should update order state" do
    order1 = orders(:one)
    order2 = orders(:two)
    order3 = orders(:three)

    visit root_path

    click_on("Complete", match: :first)

    # Check that there are exactly two divs with class 'order' on the page now that one order has been marked as completed
    assert_selector "div.order", count: 2

    # Check if the order that is marked as completed is not shown on the page anymore
    assert_no_text order1.uuid
    assert_text order2.uuid
    assert_text order3.uuid
  end
end
