## Project "Sol"

### Open source MMORPG server for Linux based on AzerothCore

<br>

This is a custom version of AzerothCore (AC). The actual AC project is located here: https://www.azerothcore.org/<br>
The [AC master branch](https://github.com/azerothcore/azerothcore-wotlk) on GitHub has been cloned into branch "[ac\_master](https://gitlab.com/opfesoft/sol/-/tree/ac_master)" and will be kept up to date in order to be able to reference commits from within GitLab.

You are free to use Sol, but there won't be any support for it. This is solely a learning / fun project. However, you can use [this contact](mailto:stoabrogga@proton.me) if you have any questions.

#### Project components:
- [Sol-Docs](https://gitlab.com/opfesoft/sol-docs): Documentation (updated, cleaned up and adapted to Sol)
  - [Build tips](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/Build-Tips.md)
  - [Performance](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/Performance.md)
  - [Client config tips](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/Client-Config-Tips.md)
  - [GM commands](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/GM-Commands.md)
  - [GM tips](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/GM-Tips.md)
  - [Auth DB](https://gitlab.com/opfesoft/sol-docs/-/tree/master/db/auth)
  - [Characters DB](https://gitlab.com/opfesoft/sol-docs/-/tree/master/db/characters)
  - [World DB](https://gitlab.com/opfesoft/sol-docs/-/tree/master/db/world)
  - [DBC](https://gitlab.com/opfesoft/sol-docs/-/tree/master/dbc)
- Server software:
  - [Sol](https://gitlab.com/opfesoft/sol)
- AC modules (adapted to Sol):
  - [mod-ah-bot](https://gitlab.com/opfesoft/mod-ah-bot)
  - [mod-autobalance](https://gitlab.com/opfesoft/mod-autobalance)
  - [mod-morphsummon](https://gitlab.com/opfesoft/mod-morphsummon)
  - [mod-npc-beastmaster](https://gitlab.com/opfesoft/mod-npc-beastmaster)
  - [mod-transmog](https://gitlab.com/opfesoft/mod-transmog)
  - [mod-weapon-visual](https://gitlab.com/opfesoft/mod-weapon-visual)
- Sol modules:
  - [mod-stoabrogga](https://gitlab.com/opfesoft/mod-stoabrogga)

#### Customizations:
- Sol is based on azerothcore-wotlk commit 2eb07056680776f85fcd700d45defa37c0ff9815 (2020-02-28)
- Sol only supports Linux, MariaDB 10.6.5+, CMake 3.19+ and GCC 11+
- The following components have been removed as they are not needed for this project and are just bloating the code:
  - Eluna support (see AC commits 00777a80ae067d18634e2b515a118e81e5cf47e5, be3abe21d919ec0fef0b8b3a5fec197fe916ee71, 204160b121a40a7cda92eec94f518079b6204d3c, 7ad58aa6ea642750d300cab01e7cfdd7fb5d1902)
  - CFBG support (see AC commits 782150ead311b47b030ea5b2aba8cdad478c0b19, e15a0c218942f602d55584b7235eb69254c3a35b, a425de6a1fc2489a5fba3be6ee560395da9df353, d40e8946180129b39172c2a1b4d690aa71723917)
  - Windows support and it's dependencies to the provided and outdated acelite & mysqllite libs
  - Docker support, CI, SQL archive etc.
- The changes concerning ACE removal have been reverted (see AC commits 30b0325cee4a1b7b3992b80ea863483fc6fc0d30, 1977336050955f40d6eb33b8c601435e8559a50a, 4a8f1de5381d1cf53cdcc4c5bb7d9ef7c99a8a8f); ACE won't be replaced for this project as the libary is still maintained and stable (see "[ACE installation](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/Build-Tips.md#ace-installation)" on how to build the latest ACE version)
- Only specific AC commits will be taken over (sometimes modified)
  - A list of skipped AC commits is available here for documentation purposes: [Skipped-AC-Commits](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/Skipped-AC-Commits.md)<br>
    (2020-09-09: Stopped tracking all commits in this list, as Sol follows its own development path and also too many bugs make their way into AC; interesting commits will be tracked as "[TODOs](https://gitlab.com/opfesoft/sol-docs/-/blob/master/misc/TODO.md)" which have to be further verified and/or reworked)
  - Features will only be taken over from AC if they are useful for fixing bugs (with the exception of a few smaller features that are non-intrusive); same for all "cosmetic" changes like renaming constants, DB refactoring etc. which hold no other value than ensuring compatibility with TC (Sol does not aim to be compatible with either AC or TC)
  - Code style changes will not be taken over in order to be able to effectively compare and revert commits
- The events "Zalazane's Fall" and "Operation: Gnomeregan" will not be implemented as those events are useless without progressing to Cataclysm where the Trolls and Gnomes got their own starting areas.
- Sol aims exclusively at fixing bugs and improving the player experience; this also means to include changes which were not part of retail at the time

#### License:
- The new source components of Project "Sol" and the old sources based on AzerothCore are released under the [GNU AGPLv3](LICENSE.md) license
- The old sources based on MaNGOS/TrinityCore are released under the [GNU GPLv2](deps/gpl-2.0.md) license
