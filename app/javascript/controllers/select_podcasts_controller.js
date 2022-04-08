import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ["choix"]

  save() {
    const podcast_id = this.choixTarget.dataset.value
    const event = new CustomEvent("pick-podcast", {
      detail: {
        id: podcast_id,
        title: this.choixTarget.innerText
      }
    })
    window.dispatchEvent(event)
    }
}
