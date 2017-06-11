
$(document).on("turbolinks:load", function(){

	if( !$("#product_gender_id").val() ){
		$('#product_category_id').val('');
		$('#product_category_id').attr('disabled', 'disabled');
	}
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

	$(document).on('fields_added.nested_form_fields', function(event, param){

		console.log(event.target);
		v_str = $(event.target).prev().find("legend").text();
		v_index_str = v_str.replace( /\D+/g, '' );
		v_basis_str = v_str.replace( /\d+/g, '');
		v_index = parseInt(v_index_str) + 1;
		$(event.target).find("legend").html(v_basis_str + v_index)

	});

})