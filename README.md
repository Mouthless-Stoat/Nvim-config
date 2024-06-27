# Mouthless Nvim Config

Stuff is in the [`lua`](lua) folder, [`init.lua`](init.lua) just call all the file in that folder and set up [`lazy.nvim`](https://github.com/folke/lazy.nvim) as well.
<details>
  
<summary>Explaination for weird calling order</summary>
  
The weird calling order is because some plugin like [`indent-blankline.nvim`](https://github.com/lukas-reineke/indent-blankline.nvim) refuse to start without their highlight group, and the base config need [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) so the weird calling order allow this. First call all the basic config in [`config.main`](https://github.com/Mouthless-Stoat/Nvim-config/blob/main/lua/config/main.lua) then install and bootstrap `lazy.nvim`, then setup the colorscheme in [`config.theme.main`](https://github.com/Mouthless-Stoat/Nvim-config/blob/main/lua/config/theme/main.lua) so that lazy plugin can have their hl group then install lazy plugin in [`lua/plugin`](lua/plugins) then finally set up the statusline cus it need the devicons

</details>

Anyway here some ss

![image](https://github.com/Mouthless-Stoat/Nvim-config/assets/89868169/fc72dd7c-861f-498e-8916-8ca36b4a01e5)
![image](https://github.com/Mouthless-Stoat/Nvim-config/assets/89868169/5f174629-227f-49de-8455-54f7d3cf1310)
![image](https://github.com/Mouthless-Stoat/Nvim-config/assets/89868169/5e6e6bb3-27bc-4574-aaf6-85d13d128196)
![image](https://github.com/Mouthless-Stoat/Nvim-config/assets/89868169/fe4b9c6f-34f5-45de-9ce1-97f5f33eda83)
![image](https://github.com/Mouthless-Stoat/Nvim-config/assets/89868169/c3e33bd0-8445-4ccf-b27f-daeeb6465a7e)
![image](https://github.com/Mouthless-Stoat/Nvim-config/assets/89868169/e7478145-5621-4ee1-a193-df5a487ad172)
![image](https://github.com/Mouthless-Stoat/Nvim-config/assets/89868169/4d005d2a-c844-43f6-8578-0392ec920eb2)

