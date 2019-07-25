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
          $(this).parent().parent().find('.item-stock').text(`在庫: ${data.stock}枚`);
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
