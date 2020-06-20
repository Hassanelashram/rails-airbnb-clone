import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];
  search = document.getElementById('search');

  refresh() {
    var myinput = search.value;
    fetch(`/cars?query=${myinput}`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        const display = document.getElementById('display-sugg');
        display.innerHTML = '';
        const firstFour = data.cars.slice(0,4)
        firstFour.forEach((element) => {
          if (myinput === '') {
            display.style.display = 'none';
          } else {
          display.style.display = 'block';
          const wordLi = `<li><a href='/cars/${element.id}'>${element.name} · ${element.brand} </a></li>`;
          display.insertAdjacentHTML('beforeend', wordLi);
          }
        });
      });
  }
}
