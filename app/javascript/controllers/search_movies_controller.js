import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "movie", "query"]

  update(event) {
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
    const title = event.detail.title
    this.inputTarget.value = title
    this.listTarget.classList.add("d-none")
  }
}
