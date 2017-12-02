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
      text: 'What is your highest educational attainment?',
      quick_replies: [
        {
           content_type: 'text',
           title: "Primary School",
           payload: "Primary School"
        },
        {
           content_type: 'text',
           title: "Grade School",
           payload: "Grade School"
        },
        {
           content_type: 'text',
           title: "Junior High School",
           payload: "Junior High School"
        },
        {
           content_type: 'text',
           title: "Senior High School",
           payload: "Senior High School"
        },
        {
           content_type: 'text',
           title: "Vocational Course",
           payload: "Vocational Course"
        },
        {
           content_type: 'text',
           title: "Associate's Degree",
           payload: "Associate's Degree"
        },
        {
           content_type: 'text',
           title: "Bachelor's Degree",
           payload: "Bachelor's Degree"
        },
        {
           content_type: 'text',
           title: "Master's Degree",
           payload: "Master's Degree"
        },
        {
           content_type: 'text',
           title: "Doctorate",
           payload: "Doctorate"
        }
      ])

    Bot.on :postback do |postback|
      message.reply(text: "HEH")
    end
  end
end


welcome
