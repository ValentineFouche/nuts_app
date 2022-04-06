import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["choix"]

  save() {
    const movie_id = this.choixTarget.dataset.value
    console.log(movie_id)
    }
}
