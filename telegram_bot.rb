require 'telegram/bot'

token = '579503907:AAFPwkuX9j1i7fXH-f4jiB1IL7kUsMtvib0'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "안녕하세요, #{message.from.first_name}")
    when 'price'
      btc_price='1050'
      bot.api.send_message(chat_id: message.chat.id, text: "BTC : "+ btc_price + "만원")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "빠잇!, #{message.from.first_name}")
    end
  end
end