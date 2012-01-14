module SelectDatetastic
  module SelectDateViewHelper
    def select_datetastic date=nil, options={}, html_options={}, datetastic_options={}
      select_date_args = [date, options, html_options].compact
      select_date(*select_date_args).tap do
        gsub! /date/,  datetastic_options[:date] if datetastic_options[:date]
        gsub! /year/,  datetastic_options[:date] if datetastic_options[:year]
        gsub! /month/, datetastic_options[:date] if datetastic_options[:month]
        gsub! /day/,   datetastic_options[:date] if datetastic_options[:day]
      end
    end
  end
end
