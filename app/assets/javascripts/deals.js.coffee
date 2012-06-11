# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(".kkcount-down").kkcountdown
		dayText: 'Tag'
		daysText: 'Tage'
		hoursText: 'H'
		minutesText: 'M'
		secondsText: 'S'
		textAfterCount: 'sorry deal is over'
		displayDays: false
		displayZeroDays: false
