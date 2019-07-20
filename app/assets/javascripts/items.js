$(() => {
  $(document).on('turbolinks:load', () => {
    // -------showのセレクトタグ
    function getSongsAjax() {
      const disk_id = $(this).children('option:selected').val();
      const data = { id: disk_id };
      const url = $(this).data().url;
      $.ajax({
        url: url,
        type: "POST",
        data: data,
        dataType: "json",

        success: (data) => {
          $('#songs-list').fadeOut(function() {
            $(this).html('');
            data.forEach((song) => {
              let resource = `<li>${song.title}</li>`
              $(this).append(resource);
            }, 500);
            $(this).fadeIn(500);
          });
        },

        error: (XMLHttpRequest, textStatus, errorThrown) => {
          console.error("Error occurred in getSongsAjax")
          console.log(`XMLHttpRequest: ${XMLHttpRequest.status}`)
          console.log(`textStatus: ${textStatus}`)
          console.log(`errorThrown: ${errorThrown}`)
        }
      });
    }
    $('#item_disks').change(getSongsAjax);

    // -------showのセレクトタグ
  });
});
