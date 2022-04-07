import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "movie"]

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }

  createmovie(event) {
    event.preventDefault
    const movie_id = event.detail.id
    this.movieTarget.value = movie_id
  }
}
