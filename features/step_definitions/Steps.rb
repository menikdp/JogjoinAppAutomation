Given("Launch the app") do
  puts "Jogjoin launched"
end

Then("user swipe screen twice") do
  size = manage.window.size
  startx = size.width * 0.9
  endx = size.width * 0.1
  starty = size.height / 2
  swipe(start_x: startx, start_y: starty, end_x: endx, end_y: starty, duration:1000).perform
  swipe(start_x: startx, start_y: starty, end_x: endx, end_y: starty, duration:1000).perform
end

Then("user tap on mulai button") do
  find_element(:id, 'com.binar.jogjoin:id/btMulai').click
end

And("user tap on lewati") do
  find_element(:id, 'com.binar.jogjoin:id/tvSkip').click
end

#begin of purchase
When("user choose a product") do
  find_element(:id, 'com.binar.jogjoin:id/ivProduct').click
end

Then("user should see product detail") do
  swipe(start_x: (manage.window.size.width * 0.5),start_y: (manage.window.size.height * 0.6), end_x: (manage.window.size.width * 0.5), end_y: (manage.window.size.height * 0.3), duration: 500).perform
  expect(find_element(:id, 'com.binar.jogjoin:id/tvDeskripsiBar').text).to include("Deskripsi Produk")
end

Given("user tap on beli") do
  find_element(:id, 'com.binar.jogjoin:id/btBuyProduct').click
end

Then("user should fill customer data") do
  find_element(:id, 'com.binar.jogjoin:id/etNamaPenerima').send_keys("Inara")
  find_element(:id, 'com.binar.jogjoin:id/etAlamtPenerima').send_keys("Jalan Imogiri Km 2 Bantul")
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/etKotaKabupaten').send_keys("Yogyakarta")
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/etKodePos').send_keys("12345")
  scroll_to_exact("Catatan Penjual", 0)
  find_element(:id, 'com.binar.jogjoin:id/etNomorTelp').send_keys("085736300917")
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/etCatatan').send_keys("warna biru")
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/spNamaToko').send_keys("Vero Fashion")
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/spJasaPengiriman').send_keys("JNE (Rp. 23.000) 2–4 Hari")
end

When("user tap on lanjut pembayaran") do
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/btPembayaran').click
end

Then("user should see transaction detail") do
  if scroll_to_exact("Silahkan lakukan pembayaran")
    puts "Detail transaksi ditampilkan"
  end
end

When("user tap Selesai button") do
  find_element(:id, 'com.binar.jogjoin:id/btSelesai').click
end

Then("user should see popup") do
  self.driver.find_element(:id, "com.binar.jogjoin:id/customPanel")
  switch_to
  expect(find_element(:id, 'com.binar.jogjoin:id/buktiTransfer').text).to eq("Silahkan lakukan pembayaran\ndan upload bukti transfer.")
end

Then("user tap OK") do
  find_element(:id, 'com.binar.jogjoin:id/lanjutkanTransaksi').click
end
# end of purchase

#begin of register
Then("user tap on disini") do
  find_element(:id, 'com.binar.jogjoin:id/tvRegister').click
end

Given("user choose register as Merchant") do
  find_element(:accessibility_id, 'MERCHANT').click
end

When("user tap on Lanjut button as merchant") do
  if find_element(:accessibility_id, 'MERCHANT')
    find_element(:id, 'com.binar.jogjoin:id/btMerchant').click
  end
end

Then("user fill all merchant data correctly") do
  #create fake data
  merchant_name = Faker::Name.last_name
  shop_name = merchant_name+" Shop"
  merchant_address = Faker::Address.street_address + " Yogyakarta"
  merchant_email = Faker::Internet.safe_email(merchant_name)
  merchant_password = merchant_name+"123"
  merchant_phonenumber = Faker::PhoneNumber.phone_number
  find_element(:id, 'com.binar.jogjoin:id/etNamaTokoMerchant').send_keys(shop_name)
  find_element(:id, 'com.binar.jogjoin:id/etAlamatToko').send_keys(merchant_address)
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/etNamaMerchant').send_keys(merchant_name)
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/etEmailMerchant').send_keys(merchant_email)
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/etNoHPMerchant').send_keys(merchant_phonenumber)
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/etAlamat').send_keys(merchant_address)
  scroll_to_exact("LANJUT")
  find_element(:id, 'com.binar.jogjoin:id/etPasswordMerchant').send_keys(merchant_password)
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/etPasswordConfirmationMerchant').send_keys(merchant_password)
end

When("user tap on Lanjut in merchant form") do
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/btMerchant').click
end

Then("should successfully registered as Merchant") do
  expect(find_element(:id, 'com.binar.jogjoin:id/tvRegisterSucces').text).to eq("Selamat Anda Berhasil Register sebagai merchant")
end

Given("user choose register as Seller") do
  find_element(:accessibility_id, 'SELLER').click
end

When("user tap on Lanjut button as seller") do
  if find_element(:accessibility_id, 'SELLER')
    find_element(:id, 'com.binar.jogjoin:id/btSeller').click
  end
end

Then("user fill all seller data correctly") do
  seller_name = Faker::Name.last_name
  seller_email = Faker::Internet.safe_email(seller_name)
  seller_password = seller_name+"123"
  find_element(:id, 'com.binar.jogjoin:id/etNamaSeller').send_keys(seller_name)
  find_element(:id, 'com.binar.jogjoin:id/etEmailSeller').send_keys(seller_email)
  find_element(:id, 'com.binar.jogjoin:id/etPasswordSeller').send_keys(seller_password)
  hide_keyboard
  find_element(:id, 'etPasswordConfirmationSeller').send_keys(seller_password)
end

When("user tap on lanjut button in seller form") do
  hide_keyboard
  find_element(:id, 'com.binar.jogjoin:id/btSeller').click
end

Then("user should successfully registered as Seller") do
  expect(find_element(:id, 'com.binar.jogjoin:id/tvRegisterSucces').text).to eq("Selamat Anda Berhasil Register sebagai seller")
end
#end of register

#begin of login
Given("user fill login data correctly") do
  find_element(:id, 'com.binar.jogjoin:id/etEmailLogin').send_keys("alibaba@example.com")
  find_element(:id, 'com.binar.jogjoin:id/etPasswordLogin').send_keys("alibaba123")
end

When("user tap on Masuk button") do
  find_element(:id, 'com.binar.jogjoin:id/btLogin').click
end

Then("user should login Successfully") do
  puts "Berhasil login"
end

Given("user did not fill any data on login form") do
  puts "Did not fill any data"
end

Then("user see error message") do
  execute_command("mobile: isToastVisible", {text: 'Email atau password tidak boleh kosong'})
end
#end of login