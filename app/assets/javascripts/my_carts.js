$(document).on("turbolinks:load", function(){
	// $('#cart-index-submit').on('click', function() { $('#cart-index-form').submit(); });
	$('#cart-index-form').change(function(){
		this.submit()
	})
})