$(() => {

  const addElementDisk = () => {
    let diskCount = $('#disks').children('.nested-fields').length;
    diskHeading = '<h4>ディスク ' + diskCount + '</h4>';
    $('#disks>.nested-fields').eq(diskCount - 1).prepend(diskHeading);
  };

  addElementDisk();

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
});
