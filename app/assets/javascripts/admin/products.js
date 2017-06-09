
$(document).on("turbolinks:load", function(){
	$('#product_category_id').attr('disabled', 'disabled');
	categories = $('#product_category_id').html();
	$('#product_gender_id').change(function(){
		var gender, options;
		gender = $('#product_gender_id :selected').text();
		options = $(categories).filter("optgroup[label=" + gender + "]").html();
		if (options) {
			$('#product_category_id').html(options);
			$('#product_category_id').removeAttr('disabled');
		} else {
			$('#product_category_id').empty();
		}
	});
})