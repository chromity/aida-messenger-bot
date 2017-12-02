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
    get_full_name()
  end
end

def get_full_name
  Bot.on :message do |message|
    name = message.text
    message.reply(text: "Thank you #{name}. Now, please answer some questions to get started.")

    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button', # change this
          text: "Enter your highest education attainment",
          buttons: [
            { type: 'postback', title: "Elementary", payload: "Elementary" },
            { type: 'postback', title: "Senior High School", payload: "Senior High School"},
            { type: 'postback', title: "College", payload: "College"}
          ]
        }
      }
    )

    Bot.on :postback do |postback|
      get_health_condition
    end
  end
end

def get_health_condition
  Bot.on :message do |message|
    message.reply(
      text: "Enter your health condition",
      quick_replies: [
        {
          content_type: 'text',
          title: 'Poor',
          payload: 'Poor'
        }
      ]
    )

    Bot.on :message do |message|
        payload = message.text
        message.reply(text: "Enter your current income:")
        get_income
    end
  end
end


def get_income
  Bot.on :message do |message|
    income = message.text
    message.reply(text: "#{income}")
  end
end

welcome
