from django.db import migrations

def seed_data(apps, schema_editor):
    AchievementData = apps.get_model("gameapi", "AchievementData")
    DailyMissionData = apps.get_model("gameapi", "DailyMissionData")

    daily_mission_data = [
        {'i_id': 1, 's_RewardType': 'CP', 'i_Reward_1': 10},
        {'i_id': 2, 's_RewardType': 'CP', 'i_Reward_1': 10},
        {'i_id': 3, 's_RewardType': 'CP', 'i_Reward_1': 10},
        {'i_id': 4, 's_RewardType': 'CP', 'i_Reward_1': 10},
        {'i_id': 5, 's_RewardType': 'CP', 'i_Reward_1': 10},
        {'i_id': 6, 's_RewardType': 'CP', 'i_Reward_1': 50},
    ]

    achievement_data = [
        {'i_id': 1,   's_RewardType': 'Tap_Multiply',     'i_MaxLevel': 14, 'rewards': [5,3,5,5,5,3,3,3,2,2,2,2,2,2,0,0,0,0,0,0]},
        {'i_id': 2,   's_RewardType': 'Tap_Sec_Multiply', 'i_MaxLevel': 14, 'rewards': [5,5,5,5,5,3,3,3,2,2,2,2,2,2,0,0,0,0,0,0]},
        {'i_id': 3,   's_RewardType': 'Tap_Sec_Multiply', 'i_MaxLevel': 14, 'rewards': [5,5,5,5,5,3,3,3,2,2,2,2,2,2,0,0,0,0,0,0]},
        {'i_id': 4,   's_RewardType': 'CP',               'i_MaxLevel': 12, 'rewards': [100,100,100,100,100,200,300,300,300,300,300,300,0,0,0,0,0,0,0,0]},
        {'i_id': 5,   's_RewardType': 'CP',               'i_MaxLevel': 10, 'rewards': [20,20,30,50,100,100,100,100,100,100,0,0,0,0,0,0,0,0,0,0]},
        {'i_id': 6,   's_RewardType': 'CP',               'i_MaxLevel': 12, 'rewards': [20,20,30,50,100,100,100,100,100,100,100,100,0,0,0,0,0,0,0,0]},
        {'i_id': 7,   's_RewardType': 'CP',               'i_MaxLevel': 12, 'rewards': [20,20,30,50,100,100,100,100,100,100,100,100,0,0,0,0,0,0,0,0]},
        {'i_id': 8,   's_RewardType': 'CP',               'i_MaxLevel': 12, 'rewards': [20,20,30,50,100,100,100,100,100,100,100,100,0,0,0,0,0,0,0,0]},
        {'i_id': 9,   's_RewardType': 'CP',               'i_MaxLevel': 14, 'rewards': [50,50,50,50,100,150,150,150,200,200,200,200,250,250,0,0,0,0,0,0]},
        {'i_id': 10,  's_RewardType': 'CP',               'i_MaxLevel': 14, 'rewards': [50,50,50,50,100,150,150,150,200,200,365,400,500,0,0,0,0,0,0,0]},
        {'i_id': 201, 's_RewardType': 'Tap_Sec_Multiply', 'i_MaxLevel': 12, 'rewards': [3,3,3,3,3,3,3,3,2,2,2,2,0,0,0,0,0,0,0,0]},
        {'i_id': 202, 's_RewardType': 'Tap_Sec_Multiply', 'i_MaxLevel': 14, 'rewards': [5,5,5,5,5,3,3,3,2,2,2,2,2,2,0,0,0,0,0,0]},
        {'i_id': 203, 's_RewardType': 'Tap_Sec_Multiply', 'i_MaxLevel': 14, 'rewards': [5,5,5,5,5,3,3,3,2,2,2,2,2,2,0,0,0,0,0,0]},
        {'i_id': 204, 's_RewardType': 'CP',               'i_MaxLevel': 12, 'rewards': [100,100,100,100,100,200,300,300,300,300,300,300,0,0,0,0,0,0,0,0]},
        {'i_id': 205, 's_RewardType': 'CP',               'i_MaxLevel': 12, 'rewards': [20,30,50,70,100,100,100,100,100,100,100,100,0,0,0,0,0,0,0,0]},
        {'i_id': 206, 's_RewardType': 'CP',               'i_MaxLevel': 12, 'rewards': [20,30,50,70,100,100,100,100,100,100,100,100,0,0,0,0,0,0,0,0]},
        {'i_id': 207, 's_RewardType': 'CP',               'i_MaxLevel': 14, 'rewards': [50,50,50,100,100,150,150,150,200,200,200,200,250,250,0,0,0,0,0,0]},
    ]

    for dm in daily_mission_data:
        DailyMissionData.objects.update_or_create(
            i_id=dm['i_id'],
            defaults={
                's_RewardType': dm['s_RewardType'],
                'i_Reward_1': dm['i_Reward_1'],
            }
        )

    for ach in achievement_data:
        defaults = {
            's_RewardType': ach['s_RewardType'],
            'i_MaxLevel': ach['i_MaxLevel'],
        }
        for i, reward_val in enumerate(ach['rewards']):
            defaults[f'i_Reward_{i+1}'] = reward_val
            
        AchievementData.objects.update_or_create(
            i_id=ach['i_id'],
            defaults=defaults
        )

class Migration(migrations.Migration):
    dependencies = [
        ('gameapi', '0007_rewardgroupdata_and_more'),
    ]

    operations = [
        migrations.RunPython(seed_data),
    ]
