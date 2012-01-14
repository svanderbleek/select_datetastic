require "action_view"
require "rails/railtie"
require "test/unit"

require "select_datetastic/select_date_view_helper"

class TestSelectDatetasticViewHelper < ActionView::TestCase 
  
  def setup
    ActionView::Base.send :include, SelectDatetastic::SelectDateViewHelper
    view = ActionView::Base.new
  end

  test "#select_datetastic acts as wrapper for #select_date" do
    args = [Time.now, prompt: {day: 'Choose day', month: 'Choose month', year: 'Choose year'}]
    puts view.select_datetastic
    assert_equal  view.select_date,
                  view.select_datetastic
    assert_equal view.select_date(*args), 
                 view.select_datetastic(*args)
    puts view.select_date
  end

  test "#select_datetastic allows for name=hash[key] customization" do
    args = [Time.now, {prompt: {day: 'Choose day', month: 'Choose month', year: 'Choose year'}}, {class: 'datetastic'}, {date: 'user'}]
    assert_equal false, (view.select_date *(args[0..-2])).match(/name=user\[/)
    assert_equal true, (view.select_datetastic *args).match(/name=user\[/)
  end

end
