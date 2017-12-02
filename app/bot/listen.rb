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

    message.typing_on

    message.reply(
      text: "Enter your highest educational background",
      quick_replies: [
        {
          content_type: 'text',
          title: 'Elementary',
          payload: 'Elementary'
        }
      ]
    )

    Bot.on :message do |message|
      educational_background = message.text

      message.reply(text: "Enter your current income:")

      Bot.on :message do |message|
        income = message.text

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
          health = message.text
          message.reply(text: "Please enter your expense:")

          Bot.on :message do |message|
            expense = message.text

            message.reply(
              text: "Familiar with Stocks?",
              quick_replies: [
                {
                  content_type: 'text',
                  title: 'Yes',
                  payload: 'Yes'
                },

                {
                  content_type: 'text',
                  title: 'No',
                  payload: 'No'
                }
              ]
            )

            Bot.on :message do |message|
              stocks = message.text

              message.reply(
                text: "Familiar with Crypto?",
                quick_replies: [
                  {
                    content_type: 'text',
                    title: 'Yes',
                    payload: 'Yes'
                  },

                  {
                    content_type: 'text',
                    title: 'No',
                    payload: 'No'
                  }
                ]
              )

              Bot.on :message do |message|
                crypto = message.text

                message.reply(
                  text: "Do you have a Unionbank Account?",
                  quick_replies: [
                    {
                      content_type: 'text',
                      title: 'Yes',
                      payload: 'Yes'
                    },

                    {
                      content_type: 'text',
                      title: 'No',
                      payload: 'No'
                    }
                  ]
                )

              setup_account
            end
          end
        end
      end
    end
  end
end

def setup_account
  Bot.on :message do |message|
    have_union = message.text

    message.reply(
      text: "Continue to predictions?",
      quick_replies: [
        {
          content_type: 'text',
          title: 'Yes',
          payload: 'Yes'
        },

        {
          content_type: 'text',
          title: 'No',
          payload: 'No'
        }
      ]
    )

    menu
  end
end

def menu
end

welcome
