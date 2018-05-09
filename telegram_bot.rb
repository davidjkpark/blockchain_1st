require 'telegram/bot'
require 'httparty'

token = '579503907:AAFPwkuX9j1i7fXH-f4jiB1IL7kUsMtvib0'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
    	bot.api.send_message(chat_id: message.chat.id, text: "안녕하세요, #{message.from.first_name}")
    when '/price'
    	url="https://crix-api-endpoint.upbit.com/v1/crix/candles/minutes/1?code=CRIX.UPBIT.KRW-BTC"
		price=HTTParty.get(url).body
		target_price=JSON.parse(price)
		real_price=target_price[0]['tradePrice']

    	url="https://crix-api-endpoint.upbit.com/v1/crix/candles/minutes/1?code=CRIX.UPBIT.USDT-BTC"
		price=HTTParty.get(url).body
		target_price=JSON.parse(price)
		real_price_usdt=target_price[0]['tradePrice']

      	bot.api.send_message(chat_id: message.chat.id, text: "BTC : "+ (real_price/10000).to_s + "만원")
    when '/stop'
      	bot.api.send_message(chat_id: message.chat.id, text: "빠잇!, #{message.from.first_name}")
    end
  end
end