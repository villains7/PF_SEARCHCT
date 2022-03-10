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
import interactionPlugin from '@fullcalendar/interaction';
import bootstrapPlugin from '@fullcalendar/bootstrap';

document.addEventListener('turbolinks:load', function() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    locale: 'ja',
    height: 'auto',
    fixedWeekCount: false,
    buttonText: {
      today: '今日'
    },
    dayCellContent: function(e) {
    e.dayNumberText = e.dayNumberText.replace('日', '');
    },
    plugins: [ dayGridPlugin, interactionPlugin ,bootstrapPlugin]
  });
  calendar.render();
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()
