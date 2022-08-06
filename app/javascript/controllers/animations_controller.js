import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animations"
export default class extends Controller {
  static targets = [ "listItem" ]

  connect() {
    
  }

  listItemTargetConnected(element) {
    console.log( element.classList.add("animation_show") )
  }

  testing(event) {
    console.log("turbo:frame-load event was fired")
  }
}
