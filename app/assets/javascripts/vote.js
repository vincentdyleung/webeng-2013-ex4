$(document).ready(function() {
	$("button.vote").click(function() {
		var button = $(this)
		var add_url = "/vote/" + button.attr("id") + "/add";
		var remove_url = "/vote/" + button.attr("id") + "/remove";
		if (!button.hasClass("disabled")) {
			$.ajax({
				url: add_url,
				success: function(data, status, jqXHR) {
					if (data == "success") {
						button.removeClass("btn-primary");
						button.addClass("btn-success disabled");
						button.html("Voted")
					}
				}
			});
		} else {
			$.ajax({
				url: remove_url,
				success: function(data, status, jqXHR) {
					if (data == "success") {
						button.removeClass("btn-success disabled");
						button.addClass("btn-primary");
						button.html("Vote");
					}
				}
			})
		}
	});
});

