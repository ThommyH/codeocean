class UserMailer < ActionMailer::Base
  def activation_needed_email(user)
    @activation_url = activate_internal_user_url(user, token: user.activation_token)
    mail(subject: t('mailers.user_mailer.activation_needed.subject'), to: user.email)
  end

  def activation_success_email(*)
  end

  def reset_password_email(user)
    @reset_password_url = reset_password_internal_user_url(user, token: user.reset_password_token)
    mail(subject: t('mailers.user_mailer.reset_password.subject'), to: user.email)
  end

  def got_new_comment(comment, request_for_comment, commenting_user)
    # todo: check whether we can take the last known locale of the receiver?
    @receiver_displayname = request_for_comment.user.displayname
    @commenting_user_displayname = commenting_user.displayname
    @comment_text = comment.text
    @rfc_link = request_for_comment_url(request_for_comment)
    mail(subject: t('mailers.user_mailer.got_new_comment.subject', commenting_user_displayname: @commenting_user_displayname), to: request_for_comment.user.email)
  end

  def got_new_comment_for_subscription(comment, subscription, from_user)
    @receiver_displayname = subscription.user.displayname
    @author_displayname = from_user.displayname
    @comment_text = comment.text
    @rfc_link = request_for_comment_url(subscription.request_for_comment)
    @unsubscribe_link = unsubscribe_subscription_url(subscription)
    mail(subject: t('mailers.user_mailer.got_new_comment_for_subscription.subject', author_displayname: @author_displayname), to: subscription.user.email)
  end

  def send_thank_you_note(request_for_comments, receiver)
    @receiver_displayname = receiver.displayname
    @author = request_for_comments.user.displayname
    @thank_you_note = request_for_comments.thank_you_note
    @rfc_link = request_for_comment_url(request_for_comments)
    mail(subject: t('mailers.user_mailer.send_thank_you_note.subject', author: @author), to: receiver.email)
  end
end
