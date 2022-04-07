import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ["choix"]

  save() {
    const movie_id = this.choixTarget.dataset.value
    const event = new CustomEvent("pick-movie", {
      detail: {
        id: movie_id,
        title: this.choixTarget.innerText
      }
    })
    window.dispatchEvent(event)
    }
}
