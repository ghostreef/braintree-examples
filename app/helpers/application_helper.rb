module ApplicationHelper
  def title(page_title)
    content_for(:head, content_tag(:title, (page_title.try(:to_s) || 'Braintree Examples')))
  end
end
