require('gitblame').setup {
  display_virtual_text = 0,
  message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
}
