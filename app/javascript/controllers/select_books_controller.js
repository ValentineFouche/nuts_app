import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ["choix"]

  save() {
    const book_id = this.choixTarget.dataset.value
    const event = new CustomEvent("pick-book", {
      detail: {
        id: book_id,
        title: this.choixTarget.innerText
      }
    })
    window.dispatchEvent(event)
    }
}
