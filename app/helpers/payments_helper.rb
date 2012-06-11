module PaymentsHelper
  def li_method(value, label, checked=false)
    raw("<li>
      <label>
        #{radio_button_tag(:method, value, checked)}
        <span>#{label}</span>
      </label>
    </li>")
  end  
end
