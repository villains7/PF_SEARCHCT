import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';



$(document).ready(function() {
  let calendarEl = document.getElementById("calendar");
   if (calendarEl != null) {
    let calendar = new Calendar(calendarEl, {
      plugins: [dayGridPlugin, interactionPlugin],
      //カレンダーのカスタマイズ
      locale: 'ja',
      height: 'auto',
      fixedWeekCount: false,
      buttonText: {
        today: '今日'
      },
      dateClick: function(info){
        const year = info.date.getFullYear();
        const month = (info.date.getMonth() + 1);
        const day = info.date.getDate();
        
        // ajaxでevent/newを着火させ、htmlを受け取る
        $.ajax({
          type: 'GET',
          url: '/events/new',
        }).done(function (res) {
          //成功処理
          //受け取ったhtmlをmodalのbodyの中に挿入する
          $('.modal-body').html(res);
          
          //フォームの年、月、日を自動入力
          $('#event_start_1i').val(year);
          $('#event_start_2i').val(month);
          $('#event_start_3i').val(day);
          
          $('#modal').fadeIn();
          
        }).fail(function (result) {
          //失敗処理
          alert("failed");
        });

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
