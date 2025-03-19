# frozen_string_literal: true

class Subscription::New
  extend ::LightService::Organizer

  def self.call(params)
    with(params: params).reduce(
      User::UpdateAccountAction,
      Subscription::CreateAction,
      # Payment::CreatePayment,
      # Subscription::SendEmail
    )
  end
end
