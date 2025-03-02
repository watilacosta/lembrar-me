import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

if (document.getElementById('nav-mobile-btn')) {
    document.getElementById('nav-mobile-btn').addEventListener('click', function () {
        if (this.classList.contains('close')) {
            document.getElementById('nav').classList.add('hidden');
            this.classList.remove('close');
        } else {
            document.getElementById('nav').classList.remove('hidden');
            this.classList.add('close');
        }
    });
}

// BUTTON TOP
const btnTop = document.getElementById("btn-top");

window.addEventListener("scroll", () => {
    if (window.scrollY > 200) {
        btnTop.classList.remove("opacity-0");
        btnTop.classList.add("opacity-100");
    } else {
        btnTop.classList.remove("opacity-100");
        btnTop.classList.add("opacity-0");
    }
});

btnTop.addEventListener("click", () => {
    window.scrollTo({ top: 0, behavior: "smooth" });
});