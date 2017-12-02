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
    @user = User.find_by(messenger_id: message.sender[:id])
    if @user.present?
      if @user.name.present?
        message.reply(text: "Welcome back, #{@user.name}!",
        quick_replies: [
          {content_type: 'text',
           title: "Sure, let's start!",
           payload: "Sure, let's start!"
          }
        ])
        main_process
      else
        message.reply(text: 'Welcome back, to get started please enter your full name.')
        get_full_name()
      end
    else
      @user = User.create(messenger_id: message.sender[:id])
      message.reply(text: 'Hello, to get started please enter your full name.')
      get_full_name()
    end
  end
end

def get_full_name
  Bot.on :message do |message|
    name = message.text
    @user = User.find_by(messenger_id: message.sender[:id])
    @user.update(name: name)
    message.reply(
      text: "Thank you #{name}! Let's start?",
      quick_replies: [
      {content_type: 'text',
       title: "Sure, let's start!",
       payload: "Sure, let's start!"
      }
    ])

    sleep 1
    main_process
  end
end

def main_process
  Bot.on :message do |message|
    message.typing_on
    message.reply(text: "Please answer few questions to continue.")

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
          title: 'Senior High School',
          payload: 'SHS'
        },{
          content_type: 'text',
          title: 'College',
          payload: 'College'
        }
      ]
    )

    Bot.on :message do |message|
      @user = User.find_by(messenger_id: message.sender[:id])

      educational_background =  case message.text
                                when "Elementary" then "Grade School"
                                when "SHS"        then "Senior High School"
                                when "College"    then "Bachelor's Degree"
                                end

      @user.update(educational_attachment: educational_background)

      message.reply(text: "Enter your total current allowances or income")

      Bot.on :message do |message|
        income = message.text
        @user = User.find_by(messenger_id: message.sender[:id])
        @user.update(income: income.to_i)

        sleep 1

        message.reply(
          text: "Good health is not something we can buy. However, it can be an extremely valuable savings account. So should not take your health for granted. To further give you good advise, I would like to ask your health condition",
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
          health =  case message.text
                    when "Poor" then "Poor Health Condition"
                    when "Fair" then "Fair Health Condition"
                    when "Good" then "Good Health Condition"
                    end
          @user = User.find_by(messenger_id: message.sender[:id])
          @user.update(health_condition: health)

          message.reply(text: "Please enter your monthly expense:")

          Bot.on :message do |message|
            expense = message.text
            @user = User.find_by(messenger_id: message.sender[:id])
            @user.update(expense: expense.to_i)

            sleep 1

            message.reply(
              text: "Are you familiar with Stocks?",
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
      text: "Ready to take a risk? Don't worry, I'll be your partner to help you be successful. Want to know what you can get after investment?",
      quick_replies: [
        {
          content_type: 'text',
          title: 'Go Ahead!',
          payload: 'Yes'
        }
      ]
    )

    menu
  end
end

def menu
  Bot.on :message do |message|
    message.reply(
    text: "Hi, based on your answers, it's better to be sure for your future. Here are my suggestions on which things you should invest as early as now!",
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
          payload: 'Travel'
        }
      ]
    )

    Bot.on :message do |message|
      goal = message.text

      message.reply(
        text: "Interested in taking Insurance Plan?",
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

      if message.text == "Yes"
        Bot.on :message do |message|
          get_insurance = message.text

          message.reply(
            text: "What is your investment plan?",
            quick_replies: [
              {
                content_type: 'text',
                title: "Long Term",
                payload: "Long Term"
              },
              {
                content_type: 'text',
                title: "Short Term",
                payload: "Short Term"
              },
              {
                content_type: 'text',
                title: "Undecided",
                payload: "Undecided"
              }
            ]
          )

          Bot.on :message do |message|
            plan = message.text

            message.reply(text: "How much percentage of your current allowance/income do you want to allocate in this kind of plan?")
            Bot.on :message do |message|
              income_percentage = message.text
              @user = User.find_by(messenger_id: message.sender[:id])
              if @user.insurances.present?
                @user.insurances.first.update(
                  sickness: (income_percentage/100),
                  disability: (income_percentage/100),
                  maternity: (income_percentage/100),
                  retirement: (income_percentage/100),
                  funeral: (income_percentage/100),
                  death: (income_percentage/100),
                  education: (income_percentage/100)
                )
              else
                @user.insurances.create(
                  sickness: (income_percentage/100),
                  disability: (income_percentage/100),
                  maternity: (income_percentage/100),
                  retirement: (income_percentage/100),
                  funeral: (income_percentage/100),
                  death: (income_percentage/100),
                  education: (income_percentage/100)
                )
              end

              message.reply(
                text: " ",
                quick_replies: [
                  {
                    content_type: 'text',
                    title: 'Stock',
                    payload: 'Stock'
                  },
                  {
                    content_type: 'text',
                    title: 'Cryptocurrency',
                    payload: 'Cryptocurrency'
                  },
                  {
                    content_type: 'text',
                    title: 'Loan',
                    payload: 'Loan'

                  },
                  {
                    content_type: 'text',
                    title: 'Banking',
                    payload: 'Banking'
                  }
                ]
              )

              final_invest_process
            end
          end
        end
      end
    end
  end
end

def final_invest_process
  Bot.on :messages do |message|
    invest_through = message.text
    @user = User.find_by(messenger_id: message.sender[:id])

    case message.text
    when "Stock" then @user.insurances.first.update(type: "Stock")
    when "Cryptocurrency" then @user.insurances.first.update(type: "Crypto")
    end


    message.reply(
      text: 'Open Unionbank to start investing now?',
      quick_replies = [
        {
          content_type = 'text',
          title = "Sign-in",
          payload = "Sign-in"
        }
      ]
    )

    Bot.on :messages do |message|
      message.typing_on
      sleep 1
      message.reply(text: "Please enter the amount to cash-in")

      Bot.on :messages do |message|
        amount = message.text
        message.typing_on
        sleep 1
        message.reply(text: "Convert to bitcoin?",
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
          ])
        forcasted
      end

    end
    #process
    #insert coins etc
  end
end
end

def forcasted
  Bot.on :messages do |messages|
  end
end

welcome
