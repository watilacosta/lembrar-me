module PlansHelper
  def subscription_button(plan)
    if user_has_subscription_by_plan?(plan.id)
      link_to "Aguarde a Liberação do seu Plano", "#",
              class: "text-white font-medium rounded-lg text-sm px-5 py-2.5 inline-flex justify-center w-full
                      text-center bg-gray-500 cursor-not-allowed opacity-50",
              disabled: true
    else
      link_to "Assinar Agora", new_subscription_path(plan_id: plan.id),
              data: { turbo: false },
              class: "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-200
                    dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-900 font-medium rounded-lg text-sm
                    px-5 py-2.5 inline-flex justify-center w-full text-center"
    end
  end


  def user_has_subscription_by_plan?(plan_id)
    current_user.subscriptions.where(plan_id:).any?
  end
end
