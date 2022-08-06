import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animations"
export default class extends Controller {
  testing(event) {
    console.log("turbo:frame-load event was fired")
  }
}
