local present, bufferline = pcall(require, 'bufferline')

if not present then
    return
end

bufferline.setup {
  options = {
    offsets = {
      { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' }
    },
  }
}
