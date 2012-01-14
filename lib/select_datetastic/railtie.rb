require 'select_datetastic/select_date_view_helper'

module SelectDatetastic
  class Railtie < Rails::Railtie
    initializer "select_datetastic.add_select_date_view_helper" do
      ActionView::Base.send :include, SelectDateViewHelper
    end
  end
end
