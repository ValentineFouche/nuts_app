import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ["choix"]

  save() {
    const restaurant_id = this.choixTarget.dataset.value
    const event = new CustomEvent("pick-restaurant", {
      detail: {
        id: restaurant_id,
        title: this.choixTarget.innerText
      }
    })
    window.dispatchEvent(event)
    }
}
