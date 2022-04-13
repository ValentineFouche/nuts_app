import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Nuts", "Notes", "Recommendations", "Livres", "Films", "Podcasts", "Restaurants", "Partager", "Amis",],
      typeSpeed: 60,
      loop: true
    });
  }
}
