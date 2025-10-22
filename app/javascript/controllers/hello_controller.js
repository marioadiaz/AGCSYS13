import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
    console.log("👋 Stimulus está funcionando en", this.element)
  }
}
