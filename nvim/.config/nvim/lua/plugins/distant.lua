return {
  'chipsenkbeil/distant.nvim',
  -- same or worse experience than using sshfs
  enabled=false,
  branch = 'v0.3',
  config = function()
    require('distant'):setup({
      ['network.unix_socket'] = '/tmp/distant.sock',
    })
  end
}
