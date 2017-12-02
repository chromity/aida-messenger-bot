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
    message.reply(text: "Thank you #{name}.")
    message.typing_on
    message.reply(text: "Please answer a few questions to continue.")

    sleep 1

    message.reply(
      text: "Enter your highest educational background",
      quick_replies: [
        {
          content_type: 'text',
          title: 'Elementary',
          payload: 'Elementary'
        },
        {
          content_type: 'text',
          title: 'Highschool',
          payload: 'Highschool'
        },{
          content_type: 'text',
          title: 'College',
          payload: 'College'
        }
      ]
    )
    Bot.on :message do |message|
      educational_background = message.text

      message.reply(text: "Enter your current income")

      Bot.on :message do |message|
        income = message.text

        sleep 1

        message.reply(
          text: "Select your health condition",
          quick_replies: [
            {
              content_type: 'text',
              title: 'Poor',
              payload: 'Poor'
            },
            {
              content_type: 'text',
              title: 'Fair',
              payload: 'Fair'
            },
            {
              content_type: 'text',
              title: 'Good',
              payload: 'Good'
            }
          ]
        )

        Bot.on :message do |message|
          health = message.text
          message.reply(text: "Please enter your monthly expense:")

          Bot.on :message do |message|
            expense = message.text

            sleep 1

            message.reply(
              text: "Are you familiar with stocks?",
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

              #insert stocks introduction here

              message.reply(
                text: "How about Cryptocurrency?",
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

                #insert crypto introduction here

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
end

def setup_account
  Bot.on :message do |message|
    have_union = message.text


    #setup union bank account here


    message.reply(
      text: "Continue to predictions?",
      quick_replies: [
        {
          content_type: 'text',
          title: 'Go Ahead!',
          payload: 'Yes'
        }
      ]
    )

    Bot.on :message do |message|
    message.reply(
      text: "Hi #{name}, Based on your answers, it's better to be sure for your future. Here are
      my suggestions on which things you should invest as early as now!")

    message.typing_on
    menu
    end
  end
end

def menu
  Bot.on :message do |message|
    message.reply(
      text: " ",
      quick_replies: [
        {
          content_type: 'text',
          title: 'Housing',
          payload: 'Housing'
        },
        {
          content_type: 'text',
          title: 'Sickness',
          payload: 'Sickness'
        },
        {
          content_type: 'text',
          title: 'Disability',
          payload: 'Disability'
        },
        {
          content_type: 'text',
          title: 'Maternity',
          payload: 'Maternity'
        },
        {
          content_type: 'text',
          title: 'Retirement',
          payload: 'Retirement'
        },
        {
          content_type: 'text',
          title: 'Funeral',
          payload: 'Funeral'
        },
        {
          content_type: 'text',
          title: 'Education',
          payload: 'Education'
        },
        {
          content_type: 'text',
          title: 'Travel',
        }
          payload: 'Travel'
      ]
    )

    Bot.on :message do |message|
      goal = message.text
    end
  end
end

welcome
