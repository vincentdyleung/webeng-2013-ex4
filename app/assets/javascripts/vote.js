$(document).ready(function() {
	$("button.vote").click(function() {
		var button = $(this)
		var add_url = "/vote/add/" + button.attr("id");
		var remove_url = "/vote/remove/" + button.attr("id");
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

