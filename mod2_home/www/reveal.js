<script>
$(document).on("click", ".answer-toggle", function(e) {
  $(this).parent(".answer").find(".answer-content").fadeIn();
  $(this).hide();
  e.preventDefault();
});
</script>