class ApplicationDecorator < Draper::Base

  # Standardize the formatting of timestamps
  def formatted_timestamp(time)
    h.content_tag :span,
                  time.strftime("%b %Y"),
                  :class => 'timestamp'
  end

end