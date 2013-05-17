$(document).ready(function() {
	$("button.mark").click(function() {
		var button = $(this)
		var mark_url = "/pois/mark/" + button.attr("id");
		var unmark_url = "/pois/unmark/" + button.attr("id");
		if (!button.hasClass("disabled")) {
			$.ajax({
				url: mark_url,
				success: function(data, status, jqXHR) {
					if (data == "success") {
						button.removeClass("btn-primary");
						button.addClass("btn-success disabled");
						button.html("Marked")
					}
				}
			});
		} else {
			$.ajax({
				url: unmark_url,
				success: function(data, status, jqXHR) {
					if (data == "success") {
						button.removeClass("btn-success disabled");
						button.addClass("btn-primary");
						button.html("Mark");
					}
				}
			})
		}
	});
});


