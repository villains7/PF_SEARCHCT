import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';



$(document).ready(function() {
  let calendarEl = document.getElementById("calendar");
   if (calendarEl != null) {
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
        },
          {
            start:'2022-04-20',
            end:'2022-04-20',
            title: '口座振替締日',
            display: 'background'
        },
          {
            start:'2022-05-20',
            end:'2022-05-20',
            title: '口座振替締日',
            display: 'background'
        },
          {
            start:'2022-06-20',
            end:'2022-06-20',
            title: '口座振替締日',
            display: 'background'
        },
      ],

    dayCellContent: function(e) {
    e.dayNumberText = e.dayNumberText.replace('日', '');
    },
  });
  calendar.render();
   }
});
