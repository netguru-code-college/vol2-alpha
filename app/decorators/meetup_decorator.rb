class MeetupDecorator < Draper::Decorator
  delegate_all

  def info_html_text
    "<b><a href='/'>#{title}</a></b><br>#{object.description}<br><b>Event date:</b> #{object.date.strftime("%Y-%m-%d at %H:%M")}<br>We will teach you <b>#{object.technology.name}</b> in <b>#{object.language.name}</b>"
  end
end
