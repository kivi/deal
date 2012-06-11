module DealsHelper
  def datetime_to_remaining(ends_at)
    time_diff = (ends_at - Time.now)
    s = time_diff % 1.day % 1.hour % 1.minute / 1.second
    m = time_diff % 1.day % 1.hour / 1.minute
    h = (time_diff - 3600) % 1.day / 1.hour
    d = (time_diff - h.hour - m.minute) / 1.day
    [s,m,h,d]
  end
  
  def remaining_time_old
		raw '
    <div id="counterx"></div>
    <div id="numbers">
			<day><span class="number" id="d">100</span> :</day>
			<span class="number" id="s">100</span> : 
			<span class="number" id="m">04</span> : 
			<span class="number" id="z">56</span> 
		</div>
    <div id="numbers2">
			<day><span class="number" id="day">0</span> :</day>
			<span class="number" id="hour">1</span> : 
			<span class="number" id="min">01</span> : 
			<span class="number" id="sec">3</span> 
		</div>

		<div id="untertitel">
      <span id="aday">Std.</span>
			<span id="astd">Std.</span>
			<span id="amin">Min.</span>
			<span id="asek">Sek.</span>
		</div>'
  end
  
  def remaining_counter(ends_at)
    s,m,h,d = datetime_to_remaining(ends_at)
    puts "+++++++++" + s.to_s
    raw "
    <div>
			<day><span class='number' id='day'>#{d.to_i}</span> :</day>
			<span class='number' id='hour'>#{h.to_i}</span> : 
			<span class='number' id='min'>#{m.to_i}</span> : 
			<span class='number' id='sec'>#{s.to_i}</span> 
		</div>
    "
  end
  
  def remaining(ends_at)
     raw "<script type='text/javascript'>


    
      $(document).ready(function() {
        setInterval(function () {

          


          var time_left = #{ends_at.to_i} - new Date() / 1000;
          var d=Math.round(time_left/60/60/24),
              h=Math.round((time_left-d*60*60*24)/60/60)-1,
              m=Math.round((time_left-d*60*60*24-h*60*60)/60),
              s=Math.round((time_left-d*60*60*24-h*60*60)-m*60);
              s= (s==60) ? 0 : s;
              
          if (d>0) {
            $('#d').html(d);
          } else {
            $('day').remove();
          }
          
          $('#s').html(h-1);
          $('#m').html(m);
          $('#z').html(s);
          }, 100);




      });
    </script>
    "
  end
end
