require "facebook/messenger"

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Facebook::Messenger::Profile.set({
  greeting: [
    {
      locale: 'default',
      text: 'Your Smart Investment Messenger Bot.'
    }
  ]
  }, access_token: ENV['ACCESS_TOKEN'])

def welcome
  Bot.on :message do |message|
    message.reply(text: 'Hello, to get started please enter your full name.')
    get_full_name
  end
end

def get_full_name
  Bot.on :message do |message|
    name = message.text
    message.reply(text: "Thank you #{name}. Now, please answer some questions to get started. Type y to start.")
    get_education
  end
end

def get_education
  Bot.on :message do |message|
    message.reply(
      text: 'What is your highest educational attainment?',
      quick_replies: User.educational_attainments.keys.map{ |k|
        {
           content_type: 'text',
           title: k,
           payload: k
        }
      })
  end

  Bot.on :postback do |postback|
    message.reply(text: "#{postback.payload}")
  end
end

welcome
