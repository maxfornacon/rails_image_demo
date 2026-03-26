import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { imageId: Number };

  async connect() {
    const response = await fetch(`/images/${this.imageIdValue}/histogram`);
    const result = await response.json();

    new Chart(this.element, {
      type: "bar",

      data: {
        labels: result.labels,
        datasets: [{
          label: "Helligkeitswerte",
          data: result.data
        }]
      }
    });
  }
}