/*
 * Copyright (C) 2020+     Project "Sol" <https://gitlab.com/opfesoft/sol>, released under the GNU GPLv2 license: https://gitlab.com/opfesoft/sol/-/blob/master/deps/gpl-2.0.md; you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2016-2020 AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef AZEROTHCORE_CREATURE_H
#define AZEROTHCORE_CREATURE_H

#include "Common.h"
#include "Unit.h"
#include "UpdateMask.h"
#include "ItemTemplate.h"
#include "LootMgr.h"
#include "DatabaseEnv.h"
#include "Cell.h"

#include <list>

class SpellInfo;

class CreatureAI;
class Quest;
class Player;
class WorldSession;
class CreatureGroup;

enum CreatureFlagsExtra : uint32
{
    CREATURE_FLAG_EXTRA_INSTANCE_BIND                   = 0x00000001,   // creature kill bind instance with killer and killer's group
    CREATURE_FLAG_EXTRA_CIVILIAN                        = 0x00000002,   // not aggro (ignore faction/reputation hostility)
    CREATURE_FLAG_EXTRA_NO_PARRY                        = 0x00000004,   // creature can't parry
    CREATURE_FLAG_EXTRA_NO_PARRY_HASTEN                 = 0x00000008,   // creature can't counter-attack at parry
    CREATURE_FLAG_EXTRA_NO_BLOCK                        = 0x00000010,   // creature can't block
    CREATURE_FLAG_EXTRA_NO_CRUSH                        = 0x00000020,   // creature can't do crush attacks
    CREATURE_FLAG_EXTRA_NO_XP_AT_KILL                   = 0x00000040,   // creature kill not provide XP
    CREATURE_FLAG_EXTRA_TRIGGER                         = 0x00000080,   // trigger creature
    CREATURE_FLAG_EXTRA_NO_TAUNT                        = 0x00000100,   // creature is immune to taunt auras and effect attack me
    CREATURE_FLAG_EXTRA_NO_MOVE_FLAGS_UPDATE            = 0x00000200,   // creature won't update movement flags
    CREATURE_FLAG_EXTRA_GHOST_VISIBILITY                = 0x00000400,   // creature will be only visible for dead players
    CREATURE_FLAG_EXTRA_UNUSED_12                       = 0x00000800,   // TC: CREATURE_FLAG_EXTRA_USE_OFFHAND_ATTACK (creature will use offhand attacks)
    CREATURE_FLAG_EXTRA_NO_SELL_VENDOR                  = 0x00001000,   // players can't sell items to this vendor
    CREATURE_FLAG_EXTRA_UNUSED_14                       = 0x00002000,
    CREATURE_FLAG_EXTRA_WORLDEVENT                      = 0x00004000,   // custom flag for world event creatures (left room for merging)
    CREATURE_FLAG_EXTRA_GUARD                           = 0x00008000,   // Creature is guard
    CREATURE_FLAG_EXTRA_IGNORE_FEIGN_DEATH              = 0x00010000,   // creature ignores feign death
    CREATURE_FLAG_EXTRA_NO_CRIT                         = 0x00020000,   // creature can't do critical strikes
    CREATURE_FLAG_EXTRA_NO_SKILLGAIN                    = 0x00040000,   // creature won't increase weapon skills
    CREATURE_FLAG_EXTRA_TAUNT_DIMINISH                  = 0x00080000,   // Taunt is a subject to diminishing returns on this creautre
    CREATURE_FLAG_EXTRA_ALL_DIMINISH                    = 0x00100000,   // Creature is subject to all diminishing returns as player are
    CREATURE_FLAG_EXTRA_NO_PLAYER_DAMAGE_REQ            = 0x00200000,   // creature does not need to take player damage for kill credit
    CREATURE_FLAG_EXTRA_AVOID_AOE                       = 0x00400000,   // pussywizard: ignored by aoe attacks (for icc blood prince council npc - Dark Nucleus)
    CREATURE_FLAG_EXTRA_NO_DODGE                        = 0x00800000,   // xinef: target cannot dodge
    CREATURE_FLAG_EXTRA_UNUSED_25                       = 0x01000000,
    CREATURE_FLAG_EXTRA_UNUSED_26                       = 0x02000000,
    CREATURE_FLAG_EXTRA_UNUSED_27                       = 0x04000000,
    CREATURE_FLAG_EXTRA_UNUSED_28                       = 0x08000000,
    CREATURE_FLAG_EXTRA_DUNGEON_BOSS                    = 0x10000000,   // creature is a dungeon boss (SET DYNAMICALLY, DO NOT ADD IN DB)
    CREATURE_FLAG_EXTRA_IGNORE_PATHFINDING              = 0x20000000,   // creature ignore pathfinding
    CREATURE_FLAG_EXTRA_IMMUNITY_KNOCKBACK              = 0x40000000,   // creature is immune to knockback effects
    CREATURE_FLAG_EXTRA_UNUSED_32                       = 0x80000000,

    // Masks
    CREATURE_FLAG_EXTRA_UNUSED                          = (CREATURE_FLAG_EXTRA_UNUSED_12 |
                                                           CREATURE_FLAG_EXTRA_UNUSED_14 |
                                                           CREATURE_FLAG_EXTRA_UNUSED_25 | CREATURE_FLAG_EXTRA_UNUSED_26 | CREATURE_FLAG_EXTRA_UNUSED_27 |
                                                           CREATURE_FLAG_EXTRA_UNUSED_28 | CREATURE_FLAG_EXTRA_UNUSED_32),
    CREATURE_FLAG_EXTRA_DB_ALLOWED                      = (0xFFFFFFFF & ~(CREATURE_FLAG_EXTRA_UNUSED | CREATURE_FLAG_EXTRA_DUNGEON_BOSS))
};

#define MAX_AGGRO_RESET_TIME 10 // in seconds

#define MAX_KILL_CREDIT 2
#define CREATURE_REGEN_INTERVAL 2 * IN_MILLISECONDS
#define PET_FOCUS_REGEN_INTERVAL 4 * IN_MILLISECONDS
#define CREATURE_IDLE_LOS_CHECK_INTERVAL 5 * IN_MILLISECONDS

#define MAX_CREATURE_QUEST_ITEMS 6

// from `creature_template` table
struct CreatureTemplate
{
    uint32  Entry;
    uint32  DifficultyEntry[MAX_DIFFICULTY - 1];
    uint32  KillCredit[MAX_KILL_CREDIT];
    uint32  Modelid1;
    uint32  Modelid2;
    uint32  Modelid3;
    uint32  Modelid4;
    std::string  Name;
    std::string  SubName;
    std::string  IconName;
    uint32  GossipMenuId;
    uint8   minlevel;
    uint8   maxlevel;
    uint32  expansion;
    uint32  faction;
    uint32  npcflag;
    float   speed_walk;
    float   speed_run;
    float   scale;
    uint32  rank;
    uint32  dmgschool;
    float   DamageModifier;
    uint32  BaseAttackTime;
    uint32  RangeAttackTime;
    uint32  unit_class;                                     // enum Classes. Note only 4 classes are known for creatures.
    uint32  unit_flags;                                     // enum UnitFlags mask values
    uint32  unit_flags2;                                    // enum UnitFlags2 mask values
    uint32  dynamicflags;
    uint32  family;                                         // enum CreatureFamily values (optional)
    uint32  trainer_type;
    uint32  trainer_spell;
    uint32  trainer_class;
    uint32  trainer_race;
    uint32  type;                                           // enum CreatureType values
    uint32  type_flags;                                     // enum CreatureTypeFlags mask values
    uint32  lootid;
    uint32  pickpocketLootId;
    uint32  SkinLootId;
    int32   resistance[MAX_SPELL_SCHOOL];
    uint32  spells[CREATURE_MAX_SPELLS];
    uint32  PetSpellDataId;
    uint32  VehicleId;
    uint32  mingold;
    uint32  maxgold;
    std::string AIName;
    uint32  MovementType;
    uint32  InhabitType;
    float   HoverHeight;
    float   ModHealth;
    float   ModMana;
    float   ModArmor;
    bool    RacialLeader;
    uint32  movementId;
    bool    RegenHealth;
    uint32  MechanicImmuneMask;
    uint32  flags_extra;
    uint32  ScriptID;
    WorldPacket queryData; // pussywizard
    uint32  GetRandomValidModelId() const;
    uint32  GetFirstValidModelId() const;

    // helpers
    SkillType GetRequiredLootSkill() const
    {
        if (type_flags & CREATURE_TYPE_FLAG_HERB_SKINNING_SKILL)
            return SKILL_HERBALISM;
        else if (type_flags & CREATURE_TYPE_FLAG_MINING_SKINNING_SKILL)
            return SKILL_MINING;
        else if (type_flags & CREATURE_TYPE_FLAG_ENGINEERING_SKINNING_SKILL)
            return SKILL_ENGINEERING;
        else
            return SKILL_SKINNING;                          // normal case
    }

    bool IsExotic() const
    {
        return (type_flags & CREATURE_TYPE_FLAG_EXOTIC_PET) != 0;
    }
    
    bool IsTameable(bool exotic) const
    {
        if (type != CREATURE_TYPE_BEAST || family == 0 || (type_flags & CREATURE_TYPE_FLAG_TAMEABLE_PET) == 0)
            return false;

        // if can tame exotic then can tame any tameable
        return exotic || (type_flags & CREATURE_TYPE_FLAG_EXOTIC_PET) == 0;
    }

    void InitializeQueryData();
};

typedef std::vector<uint32> CreatureQuestItemList;
typedef std::unordered_map<uint32, CreatureQuestItemList> CreatureQuestItemMap;

// Benchmarked: Faster than std::map (insert/find)
typedef std::unordered_map<uint32, CreatureTemplate> CreatureTemplateContainer;

#pragma pack(push, 1)

// Defines base stats for creatures (used to calculate HP/mana/armor/attackpower/rangedattackpower/all damage).
struct CreatureBaseStats
{
    uint32 BaseHealth[MAX_EXPANSIONS];
    uint32 BaseMana;
    uint32 BaseArmor;
    uint32 AttackPower;
    uint32 RangedAttackPower;
    float BaseDamage[MAX_EXPANSIONS];

    // Helpers

    uint32 GenerateHealth(CreatureTemplate const* info) const
    {
        return uint32(ceil(BaseHealth[info->expansion] * info->ModHealth));
    }

    uint32 GenerateMana(CreatureTemplate const* info) const
    {
        // Mana can be 0.
        if (!BaseMana)
            return 0;

        return uint32(ceil(BaseMana * info->ModMana));
    }

    uint32 GenerateArmor(CreatureTemplate const* info) const
    {
        return uint32(ceil(BaseArmor * info->ModArmor));
    }

    float GenerateBaseDamage(CreatureTemplate const* info) const
    {
        return BaseDamage[info->expansion];
    }

    static CreatureBaseStats const* GetBaseStats(uint8 level, uint8 unitClass);
};

typedef std::unordered_map<uint16, CreatureBaseStats> CreatureBaseStatsContainer;

struct CreatureLocale
{
    StringVector Name;
    StringVector Title;
};

struct GossipMenuItemsLocale
{
    StringVector OptionText;
    StringVector BoxText;
};

struct PointOfInterestLocale
{
    StringVector Name;
};

#define MAX_EQUIPMENT_ITEMS 3

struct EquipmentInfo
{
    uint32  ItemEntry[MAX_EQUIPMENT_ITEMS];
};

// Benchmarked: Faster than std::map (insert/find)
typedef std::unordered_map<uint8, EquipmentInfo> EquipmentInfoContainerInternal;
typedef std::unordered_map<uint32, EquipmentInfoContainerInternal> EquipmentInfoContainer;

// from `creature` table
struct CreatureData
{
    CreatureData() : id(0), mapid(0), phaseMask(0), displayid(0), equipmentId(0),
                     posX(0.0f), posY(0.0f), posZ(0.0f), orientation(0.0f), spawntimesecs(0),
                     wander_distance(0.0f), curhealth(0), curmana(0), movementType(0),
                     spawnMask(0), npcflag(0), unit_flags(0), dynamicflags(0), dbData(true) { }
    uint32 id;                                              // entry in creature_template
    uint16 mapid;
    uint32 phaseMask;
    uint32 displayid;
    int8 equipmentId;
    float posX;
    float posY;
    float posZ;
    float orientation;
    int32 spawntimesecs;
    float wander_distance;
    uint32 curhealth;
    uint32 curmana;
    uint8 movementType;
    uint8 spawnMask;
    uint32 npcflag;
    uint32 unit_flags;                                      // enum UnitFlags mask values
    uint32 dynamicflags;
    bool dbData;
};

struct CreatureModelInfo
{
    float bounding_radius;
    float combat_reach;
    uint8 gender;
    uint32 modelid_other_gender;
};

// Benchmarked: Faster than std::map (insert/find)
typedef std::unordered_map<uint16, CreatureModelInfo> CreatureModelContainer;

enum InhabitTypeValues
{
    INHABIT_GROUND = 1,
    INHABIT_WATER  = 2,
    INHABIT_AIR    = 4,
    INHABIT_ANYWHERE = INHABIT_GROUND | INHABIT_WATER | INHABIT_AIR
};

// Enums used by StringTextData::Type (CreatureEventAI)
enum ChatType
{
    CHAT_TYPE_SAY               = 0,
    CHAT_TYPE_YELL              = 1,
    CHAT_TYPE_TEXT_EMOTE        = 2,
    CHAT_TYPE_BOSS_EMOTE        = 3,
    CHAT_TYPE_WHISPER           = 4,
    CHAT_TYPE_BOSS_WHISPER      = 5,
    CHAT_TYPE_ZONE_YELL         = 6,
    CHAT_TYPE_END               = 255
};

#pragma pack(pop)

// `creature_addon` table
struct CreatureAddon
{
    uint32 path_id;
    uint32 mount;
    uint32 bytes1;
    uint32 bytes2;
    uint32 emote;
    bool isLarge;
    std::vector<uint32> auras;
};

typedef std::unordered_map<uint32, CreatureAddon> CreatureAddonContainer;

// `creature_id_chance` table
struct CreatureIdChance
{
    uint32 id;
    float chance;
};

typedef std::vector<CreatureIdChance> CreatureIdChanceVector;
typedef std::unordered_map<uint32, CreatureIdChanceVector> CreatureIdChanceMap;

enum CreatureIdRollResult
{
    CREATURE_ID_ROLL_OK   = 1,
    CREATURE_ID_ROLL_FAIL = 2,
};

// `creature_guid_chance` table
struct CreatureGuidChance
{
    uint32 guid;
    float chance;
};

typedef std::vector<CreatureGuidChance> CreatureGuidChanceVector;
typedef std::unordered_map<uint32, CreatureGuidChanceVector> CreatureGuidChanceMap;
typedef std::unordered_map<uint32, uint32> CreatureGuidChanceIdMap;

struct CreatureGuidInstance
{
    uint32 instanceId;
    uint32 guid;
};

struct CreatureGuidMap
{
    uint32 mapId;
    uint32 guid;
};

typedef std::unordered_map<uint32, CreatureGuidInstance> CreatureGuidChanceInstanceIdMap;
typedef std::unordered_map<uint32, CreatureGuidMap> CreatureGuidChanceMapIdMap;

// Vendors
struct VendorItem
{
    VendorItem(uint32 _item, int32 _maxcount, uint32 _incrtime, uint32 _ExtendedCost)
        : item(_item), maxcount(_maxcount), incrtime(_incrtime), ExtendedCost(_ExtendedCost) {}

    uint32 item;
    uint32  maxcount;                                       // 0 for infinity item amount
    uint32 incrtime;                                        // time for restore items amount if maxcount != 0
    uint32 ExtendedCost;

    //helpers
    bool IsGoldRequired(ItemTemplate const* pProto) const { return pProto->Flags2 & ITEM_FLAGS_EXTRA_EXT_COST_REQUIRES_GOLD || !ExtendedCost; }
};
typedef std::vector<VendorItem*> VendorItemList;

struct VendorItemData
{
    VendorItemList m_items;

    VendorItem* GetItem(uint32 slot) const
    {
        if (slot >= m_items.size())
            return NULL;

        return m_items[slot];
    }
    bool Empty() const { return m_items.empty(); }
    uint8 GetItemCount() const { return m_items.size(); }
    void AddItem(uint32 item, int32 maxcount, uint32 ptime, uint32 ExtendedCost)
    {
        m_items.push_back(new VendorItem(item, maxcount, ptime, ExtendedCost));
    }
    bool RemoveItem(uint32 item_id);
    VendorItem const* FindItemCostPair(uint32 item_id, uint32 extendedCost) const;
    void Clear()
    {
        for (VendorItemList::const_iterator itr = m_items.begin(); itr != m_items.end(); ++itr)
            delete (*itr);
        m_items.clear();
    }
};

struct VendorItemCount
{
    explicit VendorItemCount(uint32 _item, uint32 _count)
        : itemId(_item), count(_count), lastIncrementTime(time(NULL)) {}

    uint32 itemId;
    uint32 count;
    time_t lastIncrementTime;
};

typedef std::list<VendorItemCount> VendorItemCounts;

struct TrainerSpell
{
    TrainerSpell() : spell(0), spellCost(0), reqSkill(0), reqSkillValue(0), reqLevel(0)
    {
        for (uint8 i = 0; i < MAX_SPELL_EFFECTS; ++i)
            learnedSpell[i] = 0;
    }

    uint32 spell;
    uint32 spellCost;
    uint32 reqSkill;
    uint32 reqSkillValue;
    uint32 reqLevel;
    uint32 learnedSpell[3];

    // helpers
    bool IsCastable() const { return learnedSpell[0] != spell; }
};

typedef std::unordered_map<uint32 /*spellid*/, TrainerSpell> TrainerSpellMap;

struct TrainerSpellData
{
    TrainerSpellData() : trainerType(0) {}
    ~TrainerSpellData() { spellList.clear(); }

    TrainerSpellMap spellList;
    uint32 trainerType;                                     // trainer type based at trainer spells, can be different from creature_template value.
                                                            // req. for correct show non-prof. trainers like weaponmaster, allowed values 0 and 2.
    TrainerSpell const* Find(uint32 spell_id) const;
};

typedef std::map<uint32, time_t> CreatureSpellCooldowns;
typedef acore::AutoPtr<time_t, ACE_Null_Mutex> LastDamagedTime;

// max different by z coordinate for creature aggro reaction
#define CREATURE_Z_ATTACK_RANGE 3

#define MAX_VENDOR_ITEMS 150                                // Limitation in 3.x.x item count in SMSG_LIST_INVENTORY

class Creature : public Unit, public GridObject<Creature>, public MovableMapObject
{
    public:

        explicit Creature(bool isWorldObject = false);
        virtual ~Creature();

        void AddToWorld() override;
        void RemoveFromWorld() override;

        void SetObjectScale(float scale) override;
        void SetDisplayId(uint32 modelId) override;

        void DisappearAndDie();

        bool Create(uint32 guidlow, Map* map, uint32 phaseMask, uint32 Entry, uint32 vehId, float x, float y, float z, float ang, const CreatureData* data = NULL);
        bool LoadCreaturesAddon(bool reload = false);
        void SelectLevel(bool changelevel = true);
        void LoadEquipment(int8 id = 1, bool force = false);

        uint32 GetDBTableGUIDLow() const { return m_DBTableGuid; }

        void Update(uint32 time) override;                         // overwrited Unit::Update
        void GetRespawnPosition(float &x, float &y, float &z, float* ori = NULL, float* dist =NULL) const;

        void SetCorpseDelay(uint32 delay) { m_corpseDelay = delay; }
        uint32 GetCorpseDelay() const { return m_corpseDelay; }
        bool IsRacialLeader() const { return GetCreatureTemplate()->RacialLeader; }
        bool IsCivilian() const { return GetCreatureTemplate()->flags_extra & CREATURE_FLAG_EXTRA_CIVILIAN; }
        bool IsTrigger() const { return GetCreatureTemplate()->flags_extra & CREATURE_FLAG_EXTRA_TRIGGER; }
        bool IsGuard() const { return GetCreatureTemplate()->flags_extra & CREATURE_FLAG_EXTRA_GUARD; }
        bool CanWalk() const { return GetCreatureTemplate()->InhabitType & INHABIT_GROUND; }
        bool CanSwim() const override { return (GetCreatureTemplate()->InhabitType & INHABIT_WATER) || IS_PLAYER_GUID(GetOwnerGUID()); }
        bool CanFly()  const override { return GetCreatureTemplate()->InhabitType & INHABIT_AIR; }

        void SetReactState(ReactStates st) { m_reactState = st; }
        ReactStates GetReactState() const { return m_reactState; }
        bool HasReactState(ReactStates state) const { return (m_reactState == state); }
        void InitializeReactState();

        ///// TODO RENAME THIS!!!!!
        bool isCanInteractWithBattleMaster(Player* player, bool msg) const;
        bool isCanTrainingAndResetTalentsOf(Player* player) const;
        bool IsValidTrainerForPlayer(Player* player, uint32* npcFlags = nullptr) const;
        bool CanCreatureAttack(Unit const* victim, bool skipDistCheck = false) const;
        bool IsImmunedToSpell(SpellInfo const* spellInfo) override;

        bool HasMechanicTemplateImmunity(uint32 mask) const;
                                                            // redefine Unit::IsImmunedToSpell
        bool IsImmunedToSpellEffect(SpellInfo const* spellInfo, uint32 index) const override;
                                                            // redefine Unit::IsImmunedToSpellEffect
        bool isElite() const
        {
            if (IsPet())
                return false;

            uint32 rank = GetCreatureTemplate()->rank;
            return rank != CREATURE_ELITE_NORMAL && rank != CREATURE_ELITE_RARE;
        }

        bool isWorldBoss() const
        {
            if (IsPet())
                return false;

            return GetCreatureTemplate()->type_flags & CREATURE_TYPE_FLAG_BOSS_MOB;
        }

        bool IsDungeonBoss() const;
        bool IsImmuneToKnockback() const;
        bool IsAvoidingAOE() const { return GetCreatureTemplate()->flags_extra & CREATURE_FLAG_EXTRA_AVOID_AOE; }

        uint8 getLevelForTarget(WorldObject const* target) const override; // overwrite Unit::getLevelForTarget for boss level support

        bool IsInEvadeMode() const { return HasUnitState(UNIT_STATE_EVADE); }

        bool AIM_Initialize(CreatureAI* ai = NULL);
        void Motion_Initialize();

        CreatureAI* AI() const { return (CreatureAI*)i_AI; }

        bool SetWalk(bool enable) override;
        bool SetDisableGravity(bool disable, bool packetOnly = false) override;
        bool SetSwim(bool enable) override;
        bool SetCanFly(bool enable, bool packetOnly = false) override;
        bool SetWaterWalking(bool enable, bool packetOnly = false) override;
        bool SetFeatherFall(bool enable, bool packetOnly = false) override;
        bool SetHover(bool enable, bool packetOnly = false) override;

        uint32 GetShieldBlockValue() const override
        {
            return (getLevel()/2 + uint32(GetStat(STAT_STRENGTH)/20));
        }

        SpellSchoolMask GetMeleeDamageSchoolMask() const override { return m_meleeDamageSchoolMask; }
        void SetMeleeDamageSchool(SpellSchools school) { m_meleeDamageSchoolMask = SpellSchoolMask(1 << school); }

        void _AddCreatureSpellCooldown(uint32 spell_id, uint32 end_time);
        virtual void AddSpellCooldown(uint32 spell_id, uint32 /*itemid*/, uint32 end_time, bool needSendToClient = false, bool forceSendToSpectator = false) override;
        virtual bool HasSpellCooldown(uint32 spell_id) const override;
        uint32 GetSpellCooldown(uint32 spell_id) const;
        void ProhibitSpellSchool(SpellSchoolMask idSchoolMask, uint32 unTimeMs) override;
        bool IsSpellProhibited(SpellSchoolMask idSchoolMask) const;

        bool HasSpell(uint32 spellID) const override;

        bool UpdateEntry(uint32 entry, const CreatureData* data=NULL, bool changelevel=true );
        bool UpdateStats(Stats stat) override;
        bool UpdateAllStats() override;
        void UpdateResistances(uint32 school) override;
        void UpdateArmor() override;
        void UpdateMaxHealth() override;
        void UpdateMaxPower(Powers power) override;
        void UpdateAttackPowerAndDamage(bool ranged = false) override;
        void CalculateMinMaxDamage(WeaponAttackType attType, bool normalized, bool addTotalPct, float& minDamage, float& maxDamage) override;

        void SetCanDualWield(bool value) override;
        int8 GetOriginalEquipmentId() const { return m_originalEquipmentId; }
        uint8 GetCurrentEquipmentId() { return m_equipmentId; }
        void SetCurrentEquipmentId(uint8 id) { m_equipmentId = id; }

        float GetSpellDamageMod(int32 Rank);

        VendorItemData const* GetVendorItems() const;
        uint32 GetVendorItemCurrentCount(VendorItem const* vItem);
        uint32 UpdateVendorItemCurrentCount(VendorItem const* vItem, uint32 used_count);

        TrainerSpellData const* GetTrainerSpells() const;

        CreatureTemplate const* GetCreatureTemplate() const { return m_creatureInfo; }
        CreatureData const* GetCreatureData() const { return m_creatureData; }
        CreatureAddon const* GetCreatureAddon() const;

        std::string GetAIName() const;
        std::string GetScriptName() const;
        uint32 GetScriptId() const;

        // override WorldObject function for proper name localization
        std::string const& GetNameForLocaleIdx(LocaleConstant locale_idx) const override;

        void setDeathState(DeathState s, bool despawn = false) override;                   // override virtual Unit::setDeathState

        bool LoadFromDB(uint32 guid, Map* map) { return LoadCreatureFromDB(guid, map, false); }
        bool LoadCreatureFromDB(uint32 guid, Map* map, bool addToMap = true);
        void SaveToDB();
                                                            // overriden in Pet
        virtual void SaveToDB(uint32 mapid, uint8 spawnMask, uint32 phaseMask);
        virtual void DeleteFromDB();                        // overriden in Pet

        Loot loot;
        uint64 GetLootRecipientGUID() const { return m_lootRecipient; }
        Player* GetLootRecipient() const;
        Group* GetLootRecipientGroup() const;
        bool hasLootRecipient() const { return m_lootRecipient || m_lootRecipientGroup; }
        bool isTappedBy(Player const* player) const;                          // return true if the creature is tapped by the player or a member of his party.
        bool CanGeneratePickPocketLoot() const { return lootPickPocketRestoreTime == 0 || lootPickPocketRestoreTime < time(NULL); }
        void SetPickPocketLootTime() { lootPickPocketRestoreTime = time(NULL) + MINUTE + GetCorpseDelay() + GetRespawnTime(); }
        void ResetPickPocketLootTime() { lootPickPocketRestoreTime = 0; }

        void SetLootRecipient (Unit* unit, bool withGroup = true);
        void AllLootRemovedFromCorpse();

        uint16 GetLootMode() const { return m_LootMode; }
        bool HasLootMode(uint16 lootMode) const { return m_LootMode & lootMode; }
        void SetLootMode(uint16 lootMode) { m_LootMode = lootMode; }
        void AddLootMode(uint16 lootMode) { m_LootMode |= lootMode; }
        void RemoveLootMode(uint16 lootMode) { m_LootMode &= ~lootMode; }
        void ResetLootMode() { m_LootMode = LOOT_MODE_DEFAULT; }

        SpellInfo const* reachWithSpellAttack(Unit* victim);
        SpellInfo const* reachWithSpellCure(Unit* victim);

        uint32 m_spells[CREATURE_MAX_SPELLS];
        CreatureSpellCooldowns m_CreatureSpellCooldowns;
        uint32 m_ProhibitSchoolTime[7];

        bool CanStartAttack(Unit const* u) const;
        float GetAggroRange(Unit const* target) const;
        float GetAttackDistance(Unit const* player) const;

        void SendAIReaction(AiReaction reactionType);

        Unit* SelectNearestTarget(float dist = 0, bool playerOnly = false) const;
        Unit* SelectNearestTargetInAttackDistance(float dist) const;

        void DoFleeToGetAssistance();
        void CallForHelp(float fRadius, bool forceAssist = false);
        void CallAssistance();
        void SetNoCallAssistance(bool val) { m_AlreadyCallAssistance = val; }
        void SetNoSearchAssistance(bool val) { m_AlreadySearchedAssistance = val; }
        bool HasSearchedAssistance() { return m_AlreadySearchedAssistance; }
        bool CanAssistTo(const Unit* u, const Unit* enemy, bool checkfaction = true, bool forceAssist = false) const;
        bool _IsTargetAcceptable(const Unit* target) const;
        bool CanIgnoreFeignDeath() const { return (GetCreatureTemplate()->flags_extra & CREATURE_FLAG_EXTRA_IGNORE_FEIGN_DEATH) != 0; }
        bool _CanDetectFeignDeathOf(const Unit* target) const; // pussywizard

        // pussywizard: updated at faction change, disable move in line of sight if actual faction is not hostile to anyone
        void UpdateMoveInLineOfSightState();
        bool IsMoveInLineOfSightDisabled() { return m_moveInLineOfSightDisabled; }
        bool IsMoveInLineOfSightStrictlyDisabled() { return m_moveInLineOfSightStrictlyDisabled; }

        MovementGeneratorType GetDefaultMovementType() const { return m_defaultMovementType; }
        void SetDefaultMovementType(MovementGeneratorType mgt) { m_defaultMovementType = mgt; }

        void RemoveCorpse(bool setSpawnTime = true, bool skipVisibility = false);

        void DespawnOrUnsummon(uint32 msTimeToDespawn = 0);

        time_t const& GetRespawnTime() const { return m_respawnTime; }
        time_t GetRespawnTimeEx() const;
        void SetRespawnTime(uint32 respawn) { m_respawnTime = respawn ? time(NULL) + respawn : 0; }
        void Respawn(bool force = false);
        void SaveRespawnTime() override;

        uint32 GetRespawnDelay() const { return m_respawnDelay; }
        void SetRespawnDelay(uint32 delay) { m_respawnDelay = delay; }

        float GetWanderDistance() const { return m_wanderDistance; }
        void SetWanderDistance(float dist) { m_wanderDistance = dist; }

        uint32 m_groupLootTimer;                            // (msecs)timer used for group loot
        uint32 lootingGroupLowGUID;                         // used to find group which is looting corpse

        void SendZoneUnderAttackMessage(Player* attacker);

        void SetInCombatWithZone();

        bool hasQuest(uint32 quest_id) const override;
        bool hasInvolvedQuest(uint32 quest_id)  const override;

        bool isRegeneratingHealth() { return m_regenHealth; }
        void SetRegeneratingHealth(bool c) { m_regenHealth = c; }
        virtual uint8 GetPetAutoSpellSize() const { return MAX_SPELL_CHARM; }
        virtual uint32 GetPetAutoSpellOnPos(uint8 pos) const
        {
            if (pos >= MAX_SPELL_CHARM || m_charmInfo->GetCharmSpell(pos)->GetType() != ACT_ENABLED)
                return 0;
            else
                return m_charmInfo->GetCharmSpell(pos)->GetAction();
        }

        void SetPosition(float x, float y, float z, float o);
        void SetPosition(const Position &pos) { SetPosition(pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), pos.GetOrientation()); }

        void SetHomePosition(float x, float y, float z, float o) { m_homePosition.Relocate(x, y, z, o); }
        void SetHomePosition(const Position &pos) { m_homePosition.Relocate(pos); }
        void GetHomePosition(float& x, float& y, float& z, float& ori) const { m_homePosition.GetPosition(x, y, z, ori); }
        Position const& GetHomePosition() const { return m_homePosition; }

        void SetTransportHomePosition(float x, float y, float z, float o) { m_transportHomePosition.Relocate(x, y, z, o); }
        void SetTransportHomePosition(const Position &pos) { m_transportHomePosition.Relocate(pos); }
        void GetTransportHomePosition(float& x, float& y, float& z, float& ori) const { m_transportHomePosition.GetPosition(x, y, z, ori); }
        Position const& GetTransportHomePosition() const { return m_transportHomePosition; }

        uint32 GetWaypointPath() const { return m_path_id; }
        void LoadPath(uint32 pathid);

        uint32 GetCurrentWaypointID() const { return m_waypointID; }
        void UpdateWaypointID(uint32 wpID){ m_waypointID = wpID; }

        void SearchFormation();
        CreatureGroup* GetFormation() const { return m_formation; }
        void SetFormation(CreatureGroup* formation) { m_formation = formation; }

        Unit* SelectVictim();

        void SetDisableReputationGain(bool disable) { DisableReputationGain = disable; }
        bool IsReputationGainDisabled() const { return DisableReputationGain; }
        bool IsDamageEnoughForLootingAndReward() const;
        void LowerPlayerDamageReq(uint32 unDamage, bool damagedByPlayer = true);
        void ResetPlayerDamageReq();
        uint32 GetPlayerDamageReq() const;
        bool HasLevelRange() const { return m_hasLevelRange; }

        uint32 GetOriginalEntry() const { return m_originalEntry; }
        void SetOriginalEntry(uint32 entry) { m_originalEntry = entry; }

        static float _GetDamageMod(int32 Rank);

        float m_SightDistance, m_CombatDistance;

        bool m_isTempWorldObject; //true when possessed

        // Handling caster facing during spellcast
        void SetTarget(uint64 guid) override;
        void FocusTarget(Spell const* focusSpell, WorldObject const* target);
        void ReleaseFocus(Spell const* focusSpell);

        // Part of Evade mechanics
        time_t GetLastDamagedTime() const;
        void SetLastDamagedTime(time_t val);
        LastDamagedTime const& GetLastDamagedTimePointer() const;
        void SetLastDamagedTimePointer(LastDamagedTime const& lastDamagedTime);

        uint64 GetDespawnTime() const { return m_despawnTime; }
        void SetAssistanceTimer(uint32 value) { m_assistanceTimer = value; }
        uint32 GetWPActiveTimer() const { return m_wpActiveTimer; }
        uint32 UpdateWPInactiveTimer(uint32 diff);
        uint32 GetWPInactiveTimerInit() const { return m_wpInactiveTimerInit; }
        void InitWPActiveTimer() { m_wpActiveTimer = m_wpActiveTimerInit; }
        uint32 GetKillDelay() const { return m_killDelay; }
        void SetKillDelay(uint32 killDelay) { m_killDelay = killDelay; }
        void DelayKill(Unit* killer, bool durabilityLoss, WeaponAttackType attackType, SpellInfo const* spellProto);
        uint64 GetKillTime() const { return m_killTime; }
        void SetKillTime(uint64 killTime) { m_killTime = killTime; }

    protected:
        bool CreateFromProto(uint32 guidlow, uint32 Entry, uint32 vehId, const CreatureData* data = NULL);
        bool InitEntry(uint32 entry, const CreatureData* data=NULL);

        // vendor items
        VendorItemCounts m_vendorItemCounts;

        static float _GetHealthMod(int32 Rank);

        uint64 m_lootRecipient;
        uint32 m_lootRecipientGroup;

        /// Timers
        time_t m_corpseRemoveTime;                          // (msecs)timer for death or corpse disappearance
        time_t m_respawnTime;                               // (secs) time of next respawn
        uint32 m_respawnDelay;                              // (secs) delay between corpse disappearance and respawning
        uint32 m_corpseDelay;                               // (secs) delay between death and corpse disappearance
        float m_wanderDistance;
        uint16 m_transportCheckTimer;
        uint32 lootPickPocketRestoreTime;
        uint32 m_wpActiveTimer;
        uint32 m_wpActiveTimerInit;
        uint32 m_wpInactiveTimer;
        uint32 m_wpInactiveTimerInit;

        ReactStates m_reactState;                           // for AI, not charmInfo
        void RegenerateHealth();
        void Regenerate(Powers power);
        MovementGeneratorType m_defaultMovementType;
        uint32 m_DBTableGuid;                               ///< For new or temporary creatures is 0 for saved it is lowguid
        uint8 m_equipmentId;
        int8 m_originalEquipmentId; // can be -1

        bool m_AlreadyCallAssistance;
        bool m_AlreadySearchedAssistance;
        bool m_regenHealth;
        bool m_AI_locked;

        SpellSchoolMask m_meleeDamageSchoolMask;
        uint32 m_originalEntry;
        
        bool m_moveInLineOfSightDisabled;
        bool m_moveInLineOfSightStrictlyDisabled;

        Position m_homePosition;
        Position m_transportHomePosition;

        bool DisableReputationGain;

        CreatureTemplate const* m_creatureInfo;                 // in difficulty mode > 0 can different from sObjectMgr->GetCreatureTemplate(GetEntry())
        CreatureData const* m_creatureData;

        uint16 m_LootMode;                                  // bitmask, default LOOT_MODE_DEFAULT, determines what loot will be lootable

        bool IsInvisibleDueToDespawn() const override;
        bool CanAlwaysSee(WorldObject const* obj) const override;

        uint64 m_despawnTime;
        uint32 m_killDelay;
        uint64 m_killTime;

    private:
        void ForcedDespawn(uint32 timeMSToDespawn = 0);
        bool CanPeriodicallyCallForAssistance() const;
        uint32 RollCreatureId(uint8 &result) const;
        uint32 RollCreatureGuid(uint32 creatureId) const;
        uint32 SetRolledGuidForInstance(uint32 rolledCreatureId, Map* map);
        void RemoveRolledGuidFromInstance();
        uint32 SetRolledGuidForMap(uint32 rolledCreatureId, Map* map);
        void RemoveRolledGuidFromMap();

        //WaypointMovementGenerator vars
        uint32 m_waypointID;
        uint32 m_path_id;

        //Formation var
        CreatureGroup* m_formation;
        bool TriggerJustRespawned;

        // This timer is shared between assisting creatures (affects both initial and scripted call for help).
        // Causing damage to one of the creatures will set the timer for all of them.
        // The shared timers are split and reset if combat is stopped.
        LastDamagedTime _lastDamagedTime;

        Spell const* _focusSpell;   ///> Locks the target during spell cast for proper facing

        int32 m_idleLosCheckTimer;
        uint32 m_assistanceTimer;
        bool m_spawnedByDefault;
        uint32 m_playerDamageReq;
        bool m_damagedByPlayer;
        bool m_hasLevelRange;

        inline static CreatureGuidChanceInstanceIdMap _creatureGuidChanceInstanceIdMap;
        inline static ACE_Thread_Mutex _creatureGuidChanceInstanceIdMapMutex;
        inline static CreatureGuidChanceMapIdMap _creatureGuidChanceMapIdMap;
        inline static ACE_Thread_Mutex _creatureGuidChanceMapIdMapMutex;
};

class AssistDelayEvent : public BasicEvent
{
    public:
        AssistDelayEvent(uint64 victim, Unit& owner) : BasicEvent(), m_victim(victim), m_owner(owner) { }

        bool Execute(uint64 e_time, uint32 p_time);
        void AddAssistant(uint64 guid) { m_assistants.push_back(guid); }
    private:
        AssistDelayEvent();

        uint64            m_victim;
        std::list<uint64> m_assistants;
        Unit&             m_owner;
};

class ForcedDespawnDelayEvent : public BasicEvent
{
    public:
        ForcedDespawnDelayEvent(Creature& owner) : BasicEvent(), m_owner(owner) { }
        bool Execute(uint64 e_time, uint32 p_time);

    private:
        Creature& m_owner;
};

class KillDelayEvent : public BasicEvent
{
    public:
        KillDelayEvent(uint64 killer, Unit& owner, bool durabilityLoss, WeaponAttackType attackType, SpellInfo const* spellProto) : BasicEvent(),
            m_killer(killer), m_owner(owner), m_durabilityLoss(durabilityLoss), m_attackType(attackType), m_spellProto(spellProto) { }
        bool Execute(uint64 e_time, uint32 p_time);

    private:
        uint64           m_killer;
        Unit&            m_owner;
        bool             m_durabilityLoss;
        WeaponAttackType m_attackType;
        SpellInfo const* m_spellProto;
};

#endif
