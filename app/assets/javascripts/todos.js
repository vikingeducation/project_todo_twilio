ready = function() {

  $("tr").hover(function () {
    $(this).find("a").toggleClass("disabled");
  });

};

$(document).ready(ready);