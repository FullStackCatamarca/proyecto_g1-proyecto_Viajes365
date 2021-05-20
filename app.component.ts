import { Component, OnInit } from '@angular/core';
import { AppclimaService } from './services/appclima.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent implements OnInit {

  location = { cityName: 'San Fernando del Valle de Catamarca', countryCode: 'ar' };
  weather = undefined;

  constructor(private appclimaService: AppclimaService) { }

  ngOnInit() {
    this.getWeather(this.location.cityName, this.location.countryCode);
  }

  getWeather(cityName: string, countryCode: string) {
    this.appclimaService
      .getWeather(cityName, countryCode)
      .subscribe(
        res => {
          console.log(res);
        },
        err => {
          console.log(err);
        }
      );
  }

  submitLocation(cityName: HTMLInputElement, countryCode: HTMLInputElement) {
    if (cityName.value && countryCode.value) {
      this.getWeather(cityName.value, countryCode.value);

      cityName.value = '';
      countryCode.value = '';
    } else {
      alert('Por favor. Insertar algunos valores');
    }
    cityName.focus();
    return false;
  }

}
