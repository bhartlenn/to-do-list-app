import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animations"
export default class extends Controller {
  static targets = [ "listItem" ]

  connect() {
    
  }

  listItemTargetConnected(element) {
    setTimeout( () => {
      element.classList.add("show_end")
    }, 100)
  }
}
