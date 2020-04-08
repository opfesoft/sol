## Project "Sol"

### Open source MMORPG server for Linux based on AzerothCore

<br>

This is a custom version of AzerothCore (AC). The actual AC project is located here: https://www.azerothcore.org/

You are free to use Sol, but there won't be any support for it. This is solely a learning / fun project.

Customizations:
- Sol is based on azerothcore-wotlk commit 2eb07056680776f85fcd700d45defa37c0ff9815 (2020-02-28)
- The following components have been removed as they are not needed for this project and are just bloating the code:
  - Eluna support (see AC commits 00777a80ae067d18634e2b515a118e81e5cf47e5, be3abe21d919ec0fef0b8b3a5fec197fe916ee71, 204160b121a40a7cda92eec94f518079b6204d3c, 7ad58aa6ea642750d300cab01e7cfdd7fb5d1902)
  - CFBG support (see AC commits 782150ead311b47b030ea5b2aba8cdad478c0b19, e15a0c218942f602d55584b7235eb69254c3a35b, a425de6a1fc2489a5fba3be6ee560395da9df353, d40e8946180129b39172c2a1b4d690aa71723917)
  - Windows support and it's dependencies to the provided and outdated acelite & mysqllite libs (Sol only supports Linux)
  - Docker support, CI (Travis), SQL archive etc.
- The changes concerning ACE removal have been reverted (see AC commits 30b0325cee4a1b7b3992b80ea863483fc6fc0d30, 1977336050955f40d6eb33b8c601435e8559a50a, 4a8f1de5381d1cf53cdcc4c5bb7d9ef7c99a8a8f); ACE won't be replaced for this project as the libary is still maintained and stable (see "[ACE installation](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/Build-Tips.md#ace-installation)" on how to build the latest ACE version)

License:
- The new AzerothCore source components are released under the [GNU AGPL v3](LICENSE-AGPL3), same for project "Sol"
- The old sources based on MaNGOS/TrinityCore are released under the [GNU GPL v2](LICENSE-GPL2)
