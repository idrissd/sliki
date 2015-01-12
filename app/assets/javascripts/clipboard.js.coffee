jQuery ->
  clip = new ZeroClipboard($("#clip_button"))
  $("#clip_button").click ->
    $(this).effect "highlight", {}, 3000