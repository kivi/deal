$(document).ready ->
	$("#formquantity").bind("ajax:success", (evt, data, status, xhr) ->
		i = jQuery.parseJSON(xhr.responseText)
		lineSelector= "#item_"+i.id
		$(lineSelector + " .quantity").val(i.quantity)
		$(lineSelector + " .price_line").html(i.price_line/100)
		$(lineSelector + " .order_total").html(i.total/100)
		$(lineSelector + " .order_vat").html(i.vat))
	

	# $("#checkout-form").submit(() ->
	# 	if !$('#agb-checkbox').is(":checked")
	# 		$('.agb-error').show()
	# 		return false
	# 	else $('.agb-error').hide()
	# )
	$("#checkout-button").click ->
		$("#checkout-form").submit()

	if ($("#notice").html() && $("#notice").html().length > 0 && $("#notice").html().substr(0,5) == 'Bitte')
		$('.agb-error').show()
		$('html, body').animate({scrollTop:$('#agb-anchor').offset().top}, 500)