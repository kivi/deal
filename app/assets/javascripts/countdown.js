$(document).ready(function() {


//var startValues = array('#sec': 60, '#min': 60, '#hour': 24);

var startValues = Array();

startValues['#sec'] = 60;
startValues['#min'] = 60;
startValues['#hour'] = 24;

function decrement(selectors) {
	var selector = selectors.shift();

	
	if (typeof selector === "undefined")
		return false ;
	counter = parseInt($(selector).text())-1;

	// console.log( selector + ':' + counter)

	if (counter < 0) {
		if (decrement(selectors)) {
			counter = startValues[selector]-1;
		} else {
			$(selector).text('00');
			return false
		}
	}
	$(selector).text((counter<10) ? '0' + counter : counter);
	return true;
}
function countdown () {
	setTimeout(function () {
		if (decrement(['#sec','#min','#hour','#hour'])) {
			countdown();
		}
	},1000);
}
countdown();
});
