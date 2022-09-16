import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  change(event) {
    document.querySelectorAll('select').forEach(dropdown => {
      if (dropdown.dataset.parentId == event.target.id) {
        this.fetchData(dropdown)
      }
    });
  }

  fetchData(dropdown) {
    const source = dropdown.dataset.source
    const parent = document.getElementById(dropdown.dataset.parentId)

    let parent_path = ''

    if (parent && parent.value == '') {
      this.createOptionsFor(dropdown, [])
      return;
    } else if (parent) {
      parent_path = [undefined, parent.dataset.source, parent.value].join("/")
    }

    const path = [parent_path, source].join("/")
    console.log(path)

    fetch(path, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then(data => { this.createOptionsFor(dropdown, data) })
  }

  createOptionsFor(dropdown, data) {
    dropdown.innerHTML = "<option value>Select</option>"
    data.forEach(item => {
      const opt = document.createElement("option")

      opt.value = item.id
      opt.innerHTML = item["name"]
      dropdown.appendChild(opt)
    })
  }
}
