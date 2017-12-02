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
    message.reply(text: "Thank you #{name}. Now, please answer some questions to get started. Type y to start.")
    get_education()
  end
end

def get_education
  Bot.on :message do |message|
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

    get_education_postback()
  end
end

def get_education_postback
  Bot.on :postback do |postback|
    message.reply(text: "HEH")
  end

  get_health_condition()
end

def get_health_condition
  Bot.on :message do |message|
    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button', # change this
          text: "Enter your highest education attainment",
          buttons: [
            { type: 'postback', title: "Poor", payload: "Poor" },
            { type: 'postback', title: "Fair", payload: "Fair"},
            { type: 'postback', title: "Good", payload: "Good"}
          ]
        }
      }
    )
  end

  get_health_postback()
end

def get_health_postback
  Bot.on :postback do |postback|
    message.reply(text: "HEH")
  end
end

welcome
