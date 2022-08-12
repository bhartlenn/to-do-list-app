import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animations"
export default class extends Controller {
  static targets = [ "listItem" ]

  connect() {
    console.log("connected!")
  }

  listItemTargetConnected(element) {
    setTimeout( () => {
      element.classList.add("fade_in")
    }, 0)
  }

  test(event) {
    console.log(event.target)
  }
}
