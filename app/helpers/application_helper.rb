module ApplicationHelper
  def facebook_like(href, options = {})
    defaults = {
      href: href, layout: 'button', action: 'like', share: false, 'show-faces': false
    }
    defaults.merge!(options)
    content_tag(:div, "", class: 'fb-like', data: defaults)
  end
end
