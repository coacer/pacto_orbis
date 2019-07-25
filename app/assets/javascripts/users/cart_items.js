$(() => {
  $(document).on('turbolinks:load', () => {
    function ChangeCartItemAmount() {
      const amount = $(this).children('option:selected').val();
      const url = $(this).data('url');
      $.ajax({
        url: url,
        type: "PATCH",
        data: { amount }, // { amount: amount }と同じ
        dataType: "json",

        success: (data) => {
          const item = data[0];
          const price = data[1];
          const $item = $(this).parent().parent();
          const statusStr = item.status ? "販売中" : "売り切れ";
          $item.find('.item-stock').text(`在庫: ${item.stock}枚`);
          $item.find('.item-status').text(statusStr);
          $('#sum-price').text(price);
        },

        error: (XMLHttpRequest, textStatus, errorThrown) => {
          console.error("Error occurred in ChangeCartItemAmount")
          console.log(`XMLHttpRequest: ${XMLHttpRequest.status}`)
          console.log(`textStatus: ${textStatus}`)
          console.log(`errorThrown: ${errorThrown}`)
        }
      });
    }

    $('.cart_item_amount').change(ChangeCartItemAmount);
  });
});
