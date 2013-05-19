$(document).ready(function() {
	$("button.confirm").click(function() {
		var button = $(this)
		var mark_url = "/pois/" + button.attr("id") + "/mark";
		var unmark_url = "/pois/" + button.attr("id") + "/unmark";
		if (!button.hasClass("disabled")) {
			$.ajax({
				url: mark_url,
				success: function(data, status, jqXHR) {
					if (data == "success") {
						button.removeClass("btn-primary");
						button.addClass("btn-success disabled");
						button.html("Confirmed");
						button.next().removeClass("hidden")
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
						button.html("Confirm");
						button.next().addClass("hidden")
					}
				}
			})
		}
	});
});


