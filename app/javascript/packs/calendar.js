import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById("calendar");
  let calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin],
    locale: 'ja',
    height: 'auto',
    fixedWeekCount: false,
    buttonText: {
      today: '今日'
    },
    events :'/events.json',
    
    dayCellContent: function(e) {
    e.dayNumberText = e.dayNumberText.replace('日', '');
    },
  });
  calendar.render();
});
