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
end
