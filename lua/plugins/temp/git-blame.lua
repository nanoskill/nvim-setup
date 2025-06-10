require('gitblame').setup {
  display_virtual_text = 0,
  date_format = "%r",
  -- message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
  message_template = "<author> (<date>)", -- template for the blame message, check the Message template section for more options
}
