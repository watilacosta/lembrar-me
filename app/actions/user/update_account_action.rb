# frozen_string_literal: true

class User::UpdateAccountAction
  extend ::LightService::Action

  expects :params
  promises :user

  executed do |ctx|
    ctx.user = User.find_by(id: ctx.params[:user_attributes][:id])
    ctx.fail!("User not_found", { clazz: "User::Update::LightService::Action" }) unless ctx.user.present?
    ctx.user.assign_attributes(ctx.params[:user_attributes])
    ctx.user.save if ctx.user.changed?
  end
end
