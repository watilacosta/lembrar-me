import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["button"]

    connect() {
        window.addEventListener("scroll", this.toggleButton.bind(this))
    }

    disconnect() {
        window.removeEventListener("scroll", this.toggleButton.bind(this))
    }

    toggleButton() {
        if (window.scrollY > 200) {
            this.buttonTarget.classList.remove("opacity-0")
            this.buttonTarget.classList.add("opacity-100")
        } else {
            this.buttonTarget.classList.remove("opacity-100")
            this.buttonTarget.classList.add("opacity-0")
        }
    }

    scrollToTop() {
        window.scrollTo({ top: 0, behavior: "smooth" })
    }
}