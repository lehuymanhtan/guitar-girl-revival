from django.db import models

class Player(models.Model):
    u_seq = models.BigAutoField(primary_key=True)
    u_id = models.CharField(max_length=64, blank=True, null=True)
    uuid = models.CharField(max_length=128, blank=True, null=True)
    device_uuid = models.CharField(max_length=128, blank=True, null=True)
    u_cp = models.BigIntegerField(default=0)
    u_nickname = models.CharField(max_length=128, blank=True, null=True)
    u_candy = models.FloatField(default=0)
    u_selected_costume_id = models.BigIntegerField(default=0)
    u_selected_music_id = models.BigIntegerField(default=0)
    u_last_login = models.DateTimeField(null=True)
    u_last_communication = models.DateTimeField(null=True)
    u_save_date = models.DateTimeField(null=True)
    u_tutorial_step = models.SmallIntegerField(default=0)
    u_review_popup = models.CharField(max_length=5, default="N")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class UserAreaInfo(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='areas')
    u_area_num = models.SmallIntegerField()
    d_Like = models.FloatField(default=0)
    i_UserFanCount = models.BigIntegerField(default=0)
    i_UserFanGrade = models.SmallIntegerField(default=0)
    i_SelectedCostumeId = models.BigIntegerField(default=0)
    i_SelectedMusicId = models.BigIntegerField(default=0)
    i_SelectedGuitarId = models.BigIntegerField(default=0)
    d_Candy = models.FloatField(default=0)
    s_TutorialList = models.TextField(blank=True)
    s_Gp1 = models.TextField(blank=True, null=True)
    s_Gp2 = models.TextField(blank=True, null=True)

class UserAchievement(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='achievements')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)
    d_Quantity = models.FloatField(default=0)
    s_Quantity = models.CharField(max_length=255, blank=True)

class UserBuff(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='buffs')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=0)
    i_ActiveTime = models.BigIntegerField(default=0)
    i_EndTime = models.BigIntegerField(default=0)

class UserCandyShop(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='candy_shops')
    i_id = models.BigIntegerField()
    i_CurrentBuyCount = models.BigIntegerField(default=0)
    i_TotalBuyCount = models.BigIntegerField(default=0)
    l_LastBuyTick = models.FloatField(default=0)
    upd_day = models.BigIntegerField(default=0)

class UserCharacter(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='characters')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)
    i_BonusLevel = models.BigIntegerField(default=0)

class UserCostume(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='costumes')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)
    i_BonusLevel = models.BigIntegerField(default=0)

class UserDailyMission(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='daily_missions')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)
    d_Quantity = models.BigIntegerField(default=0)
    upd_date = models.CharField(max_length=64, blank=True)

class UserFollower(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='followers')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)
    i_BonusLevel = models.BigIntegerField(default=0)

class UserMusic(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='musics')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)
    i_BonusLevel = models.BigIntegerField(default=0)
    b_EncoreBonusAppear = models.BigIntegerField(default=0)
    l_EncoreBonusActivateTime = models.BigIntegerField(default=0)
    i_EncoreBonusFollowerId = models.BigIntegerField(default=0)
    i_ChThirdActiveTime = models.BigIntegerField(default=0)

class UserProp(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='props')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)

class UserUnit(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='units')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)

class UserSkill(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='skills')
    i_id = models.BigIntegerField()
    b_Activate = models.SmallIntegerField(default=0)
    l_ActivateOnTicks = models.BigIntegerField(default=0)
    l_ActivateOffTicks = models.BigIntegerField(default=0)

class UserShop(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='shops')
    i_id = models.BigIntegerField()
    i_Count = models.BigIntegerField(default=0)
    i_TotalCount = models.BigIntegerField(default=0)
    i_PurchaseTime = models.BigIntegerField(default=0)
    upd_day = models.BigIntegerField(default=0)

class UserMessenger(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='messengers')
    i_MessengerChatRoomId = models.BigIntegerField()
    i_LastConfirmIndex = models.BigIntegerField(default=0)
    s_UnlockGroupList = models.TextField(blank=True, null=True)
    l_UpdateTimeTicks = models.BigIntegerField(default=0)

class UserGuitar(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='guitars')
    i_id = models.BigIntegerField()
    i_Level = models.BigIntegerField(default=1)
    i_BonusLevel = models.BigIntegerField(default=0)

class UserEventPoint(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='event_points')
    s_EventType = models.CharField(max_length=128)
    i_DataID = models.BigIntegerField()
    i_Point = models.BigIntegerField(default=0)
    i_Step = models.BigIntegerField(default=0)
    i_ADViewTime = models.BigIntegerField(default=0)
    i_Version = models.IntegerField(default=0)

class UserSubscribeList(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='subscribe_lists')
    i_SubscribeID = models.BigIntegerField()
    i_ActiveTime = models.BigIntegerField(default=0)
    i_isActive = models.BigIntegerField(default=0)

class UserSubscribePassReward(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='subscribe_pass_rewards')
    i_SubscribeID = models.BigIntegerField()
    i_Type = models.BigIntegerField(default=0)
    i_Step = models.BigIntegerField(default=0)
    i_UpdateTime = models.BigIntegerField(default=0)
    i_Version = models.IntegerField(default=0)

class UserTicketCollection(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='ticket_collections')
    i_id = models.BigIntegerField()

class UserFollowerQuest(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='follower_quests')
    i_id = models.BigIntegerField()
    i_CurrentID = models.BigIntegerField(default=0)
    i_CompleteID = models.BigIntegerField(default=0)
    d_ConditionValue1 = models.FloatField(default=0)
    d_ConditionValue2 = models.FloatField(default=0)
    d_ConditionValue3 = models.FloatField(default=0)
    i_RewardReceived1 = models.SmallIntegerField(default=0)
    i_RewardReceived2 = models.SmallIntegerField(default=0)
    i_RewardReceived3 = models.SmallIntegerField(default=0)
    i_isInfinity = models.SmallIntegerField(default=0)

class UserFollowerProfileReward(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='follower_profile_rewards')
    i_id = models.IntegerField()
    i_RewardLevel = models.IntegerField(default=0)

class UserFollowerProfile(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='follower_profiles')
    i_id = models.IntegerField()
    i_Level = models.IntegerField(default=1)
    d_Exp = models.BigIntegerField(default=0)
    i_AddCandy = models.IntegerField(default=0)

class UserFollowerGiftItem(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='follower_gift_items')
    i_id = models.IntegerField()
    i_Value = models.IntegerField(default=0)

class UserAdList(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='ad_lists')
    i_id = models.IntegerField()
    i_Count = models.IntegerField(default=0)
    i_TotalCount = models.IntegerField(default=0)
    i_LastViewTime = models.IntegerField(default=0)

class UserChThirdStage(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='ch_third_stages')
    i_id = models.IntegerField()
    i_ChapterId = models.IntegerField(default=0)
    i_StageIndex = models.IntegerField(default=0)
    i_Star = models.IntegerField(default=0)

class UserTutorial(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='tutorials')
    i_id = models.IntegerField()

class UserAdLevel(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='ad_levels')
    i_id = models.IntegerField()
    i_Level = models.IntegerField(default=1)
    i_EXP = models.IntegerField(default=0)

class UserSelectReward(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='select_rewards')
    i_GroupId = models.IntegerField()
    i_RewardGroupId = models.IntegerField(default=0)
    i_AltRewardGroupId = models.IntegerField(default=0)

class UserFollowerQuestSave(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='follower_quest_saves')
    i_CurrentID = models.BigIntegerField()
    d_ConditionValue1 = models.FloatField(default=0)
    d_ConditionValue2 = models.FloatField(default=0)
    d_ConditionValue3 = models.FloatField(default=0)

class AttendanceLog(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='attendances')
    day = models.DateField()
    rewarded_at = models.DateTimeField(auto_now_add=True)

class EventReward(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='event_rewards')
    event_type = models.CharField(max_length=64)
    step = models.BigIntegerField()
    received_at = models.DateTimeField(auto_now_add=True)