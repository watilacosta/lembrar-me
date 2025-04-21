import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "date", "time", "scheduledAt" ]

  connect() {
    this.availableTimes = [
      "08:00",
      "09:00",
      "10:00",
      "11:00",
      "12:00",
      "13:00",
      "14:00",
      "15:00",
      "16:00",
      "17:00",
      "18:00",
      "19:00",
      "20:00",
      "21:00",
      "22:00",
    ]

    this.dateTarget.addEventListener("change", () => this.populateTimes())
    this.timeTarget.addEventListener("change", () => this.updateScheduledAt())
  }

  populateTimes() {
    this.timeTarget.innerHTML = '<option value="">Selecione um horário</option>'
    this.availableTimes.forEach(time => {
      const option = document.createElement("option")
      option.value = time
      option.textContent = time
      this.timeTarget.appendChild(option)
    })
  }

  updateScheduledAt() {
    const date = this.dateTarget.value
    const time = this.timeTarget.value
    this.scheduledAtTarget.value = `${date}T${time}:00`
  }
}