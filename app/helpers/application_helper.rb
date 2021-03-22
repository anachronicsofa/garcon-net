module ApplicationHelper

  def display_money(amount)
    "R$ #{'%.2f' % amount}"
  end
end
