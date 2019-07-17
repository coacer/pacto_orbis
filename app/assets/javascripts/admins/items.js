$(() => {
  // -------new, editのディスクn表示
  const addElementDisk = () => {
    let diskCount = $('#disks').children('.nested-fields').length;
    diskHeading = '<h4>ディスク ' + diskCount + '</h4>';
    $('#disks>.nested-fields').eq(diskCount - 1).prepend(diskHeading);
  };

  addElementDisk(); // Disk1を追記

  const target = document.getElementById("disks");
  const observer = new MutationObserver(addElementDisk);

  const options = {
    childList: true
  };

  // 追加ボタンをクリックした時にDOM変化の監査開始
  $('#disks>.links').click(() => {
    observer.observe(target, options);
  });

  // 削除ボタンをクリックした時にDOM変化の監査停止
  $(document).on('click', '.remove-disk', () => {
    observer.disconnect();
  });
  // -------new, editのディスクn表示

  // -------showのセレクトタグ
  function getSongsAjax() {
    const disk_id = $('#item_disks').children('option:selected').val();
    const data = { id: disk_id };
    $.ajax({
      url: "/admins/items/get_songs",
      type: "POST",
      data: data,
      dataType: "json",

      success: (data) => {
        $('#songs-list').html('');
        data.forEach((song) => {
          let resource = `<li>${song.title}</li>`
          $('#songs-list').append(resource);
        })
      },

      error: (XMLHttpRequest, textStatus, errorThrown) => {
        console.error("Error occurred in getSongsAjax")
        console.log(`XMLHttpRequest: ${XMLHttpRequest.status}`)
        console.log(`textStatus: ${textStatus}`)
        console.log(`errorThrown: ${errorThrown}`)
      }
    });
  }

  getSongsAjax();  //ページ表示の際の呼び出し

  $('#item_disks').change(getSongsAjax);

  // -------showのセレクトタグ
});
