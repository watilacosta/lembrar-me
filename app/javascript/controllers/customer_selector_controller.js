import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "nestedForm"]

  toggle(event) {
    console.log("OK")
    const value = this.selectTarget.value

    if (value === "") {
      this.nestedFormTarget.classList.remove("hidden")
    } else {
      this.nestedFormTarget.classList.add("hidden")
    }
  }
}
