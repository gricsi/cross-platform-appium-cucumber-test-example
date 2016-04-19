# # Create a custom assertion class for UI testing
class AssertExtension

  def assert_displayed(element)
    assert_true(element.displayed?, 'Element should be displayed!')
  end

  def assert_not_displayed(element)
    assert_false(element.displayed?, 'Element should not be displayed!')
  end

  def assert_exists(id)
    assert_true(element_exists_by_id?(id), 'Element should be exists!')
  end

  def assert_not_exists(id)
    if $ENV == IOS
      # exists but not displayed
      assert_true(element_exists_by_id?(id), 'Element should be exists!')
      assert_not_displayed($driver.id(id))
    else
      # not exists
      assert_false(element_exists_by_id?(id), 'Element should not be exists!')
    end
  end


  def assert_cell_text(cell, expected_text)
    if $ENV == IOS
      text = 'UIAStaticText'
    else
      text = 'android.widget.TextView'
    end

    cell_text = cell.find_element(:class, text).text

    assert_displayed(cell)
    assert_equal(expected_text, cell_text)
  end

  def one_element_exists_and_displayed(element)
    assert(element.size == 1, '1 element should be exists')
    assert(element[0].displayed?, 'First element should be displayed!')
  end

  def more_than_one_element_are_existing_and_displayed(list)
    assert_operator(list.size, :>, 1, 'More than 1 element should be exists')
    assert(list[0].layer.displayed?, 'First element should be displayed!')
    assert(list[1].layer.displayed?, 'Second element should be displayed!')
  end

  def wait_maximum_10_seconds_for_an_element(id, timeout = 10)
    wait = Selenium::WebDriver::Wait.new :timeout => timeout
    wait.until { $driver.find_element(:id, id).displayed? }
  end

  def element_exists_by_id?(my_id)
    if $driver.find_elements(:id, my_id).size == 0
      false
    else
      true
    end
  end

end
