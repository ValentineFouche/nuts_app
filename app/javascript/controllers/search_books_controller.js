import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "book", "query1"]

  update(event) {
    const url = `${this.formTarget.action}?query1=${this.inputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }

  createbook(event) {
    event.preventDefault
    const book_id = event.detail.id
    this.bookTarget.value = book_id
    const title = event.detail.title
    this.inputTarget.value = title
    this.listTarget.classList.add("d-none")
  }
}
