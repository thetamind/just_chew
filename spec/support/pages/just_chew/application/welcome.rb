require_relative '../application'

module JustChew::Spec::Application::Welcome

  class AddressForm < JustChew::Spec::Form
    element :address, 'input[type="text"]'
  end

  class Banner < JustChew::Spec::Section
    element :title,    'h1', text: 'Order delivery or take-out!'
    element :subtitle, 'h2', text: 'Choose from a variety of local restaurants'
    section :form, AddressForm, 'form'
  end

  class Card < JustChew::Spec::Section
    element :icon, '.card-icon-top .fa'
    element :block_title, '.card-block .card-title'

    def has_fa_icon?(fa_icon)
      icon[:class].include? "fa-#{fa_icon}"
    end
  end

  class Page < JustChew::Spec::Application::Page
    set_url %q(/)

    section  :banner, Banner, '#main-banner'
    sections :cards,  Card,   '.card'
  end
end
