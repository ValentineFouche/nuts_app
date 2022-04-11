import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "restaurant", "query"]

  update(event) {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }

  createrestaurant(event) {
    event.preventDefault
    const restaurant_id = event.detail.id
    this.restaurantTarget.value = restaurant_id
    const title = event.detail.title
    this.inputTarget.value = title
    this.listTarget.classList.add("d-none")
  }
}
