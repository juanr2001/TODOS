class AdminMailer < ApplicationMailer
  default from: "no-reply@autotrak.com"
  # default to: 'juanordaz_2011@icloud.com'

    def new_user(user)
        @user = user
        mail(to: user.email,
                subject: "Testing")
    end

    # def mandrill_client
    #     @mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
    # end

    # def new_email(list)
    #     template_name = "new-business-user"
    #     template_content = []
    #     message = {
    #         to: [{email: 'juanordaz_2011@icloud'}],
    #         subject: "Welcome to Autotrak #{list.title}",
    #         merge_vars:[
    #             {rcpt: "juanordaz_2011@icloud.com"},
    #             vars: [
    #                 {name: 'BUSINESSUSERNAME', content: list.title}
    #             ]
    #         ]
    #     }

    #     mandrill_client.messages.send_template template_name, template_content, message
    # end

end
