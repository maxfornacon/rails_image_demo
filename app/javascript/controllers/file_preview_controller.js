import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "filename"]

    update() {
        const file = this.inputTarget.files[0]

        if (file) {
            this.filenameTarget.textContent = file.name
        } else {
            this.filenameTarget.textContent = "Kein Bild ausgewählt"
        }
    }
}