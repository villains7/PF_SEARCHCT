// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';


document.addEventListener('DOMContentLoaded', function() {
  let calendarEl = document.getElementById("calendar");
  let calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin],

    locale: 'ja',
    height: 'auto',
    fixedWeekCount: false,
    buttonText: {
      today: '今日'
    },
    events :[
      {
        start:'2022-03-18',
        end:'2022-03-18',
        title: '口座振替締日',
        display: 'background'
      }
    ],
    dayCellContent: function(e) {
    e.dayNumberText = e.dayNumberText.replace('日', '');
    },
  });
  calendar.render();
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()
