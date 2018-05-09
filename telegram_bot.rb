require 'telegram/bot'
require 'httparty'

token = '579503907:AAFPwkuX9j1i7fXH-f4jiB1IL7kUsMtvib0'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
    	bot.api.send_message(chat_id: message.chat.id, text: "안녕하세요, #{message.from.first_name}")
    when '/price'

      3.times do
    	url="https://crix-api-endpoint.upbit.com/v1/crix/candles/minutes/1?code=CRIX.UPBIT.KRW-BTC"
		price=HTTParty.get(url).body
		target_price=JSON.parse(price)
		real_price=target_price[0]['tradePrice']

    	url="https://crix-api-endpoint.upbit.com/v1/crix/candles/minutes/1?code=CRIX.UPBIT.USDT-BTC"
		price=HTTParty.get(url).body
		target_price=JSON.parse(price)
		real_price_usdt=target_price[0]['tradePrice']

		url="https://api.fixer.io/latest?base=USD"
		rate=HTTParty.get(url).body
		parsed_rate=JSON.parse(rate)
		target_rate=parsed_rate["rates"]["KRW"].to_i

		msg=""
		msg<<(real_price/10000).round(0).to_s + "만원\n"
		msg<<"$" + (real_price_usdt).round(0).to_s + "\n"
		msg<<((real_price/(real_price_usdt*target_rate)-1)*100).round(2).to_s + "%"

      	bot.api.send_message(chat_id: message.chat.id, text: msg)
      	sleep(5)
      end

    when '/stop'
      	bot.api.send_message(chat_id: message.chat.id, text: "빠잇!, #{message.from.first_name}")
    end
  end
end