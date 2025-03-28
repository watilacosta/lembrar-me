module SubscriptionHelper
  def progress_calculation(subscription)
    total_duration = subscription.duration_in_days
    days_elapsed = (Time.now.to_date - subscription.starts_at.to_date).to_i
    progress_percentage = [ (days_elapsed.to_f / total_duration) * 100, 100 ].min

    progress_bar = <<-HTML
      <div class="w-full bg-gray-200 rounded-full h-4 dark:bg-gray-300">
        <div class="bg-green-500 h-4 rounded-full" style="width: #{progress_percentage}%;"></div>
      </div>
      <span class="text-sm text-gray-600">#{days_elapsed} / #{total_duration} dias</span>
    HTML

    progress_bar.html_safe
  end

  def status_badge(status)
    case status
    when "active"
      "bg-green-200 text-green-800"
    when "canceled"
      "bg-red-200 text-red-800"
    when "expired"
      "bg-gray-200 text-gray-800"
    when "pending"
      "bg-yellow-200 text-yellow-800"
    else
      "bg-gray-100 text-gray-600"
    end
  end

  def toggle_subscription_link(subscription)
    link_to (subscription.active? ? "Desativar" : "Ativar"), toggle_active_subscription_path(subscription),
            data: { turbo_method: :patch },
            class: "bg-blue-100 hover:bg-blue-200 text-blue-800 text-xs font-semibold me-2 px-2.5 py-0.5
            rounded-sm white:bg-gray-700 dark:text-blue-400 border border-blue-400 inline-flex items-center
            justify-center"
  end
end
