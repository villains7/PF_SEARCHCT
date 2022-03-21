import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import rrulePlugin from '@fullcalendar/rrule';


document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById("calendar");
  let calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin,rrulePlugin],
    locale: 'ja',
    height: 'auto',
    fixedWeekCount: false,
    buttonText: {
      today: '今日'
    },
    events: [
      {
        title: '口座振替締日',
        allDay: true,
          rrule: {
                freq: 'monthly',
                count: 20,
                bymonthday: [20],
                dtstart: '2022-03-20',
                until: '2022-12-31'
            },

    }],

    dayCellContent: function(e) {
    e.dayNumberText = e.dayNumberText.replace('日', '');
    },
  });
  calendar.render();
});
