import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "buttonView", "buttonAdd", "icon" ]

  hide() {
    this.buttonViewTarget.classList.toggle("d-none")
    this.buttonAddTarget.classList.toggle("d-none")
    // this.iconTarget.classList.add("d-none")
    console.log('tu pus')
  }
}
