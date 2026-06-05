from django.db import migrations

def add_default_setting(apps, schema_editor):
    DefaultSetting = apps.get_model("gameapi", "DefaultSetting")
    
    DefaultSetting.objects.create(key="shop_call_wait", value="2")
    DefaultSetting.objects.create(key="ad_cancel_delay", value="5")   
    DefaultSetting.objects.create(key="force_menu_restric", value="true")   
    DefaultSetting.objects.create(key="max_bundle_texutre_loading", value="1")   
    DefaultSetting.objects.create(key="weather_snow", value="true")   
    DefaultSetting.objects.create(key="check_time_cheat", value="false")   
    DefaultSetting.objects.create(key="ap_max", value="60")   
    DefaultSetting.objects.create(key="ap_time", value="300")   
    DefaultSetting.objects.create(key="ap_use", value="5")   
    DefaultSetting.objects.create(key="character_exp", value="45")   
    DefaultSetting.objects.create(key="ap_shop_id", value="31")   
    DefaultSetting.objects.create(key="ap_ad_list_id", value="2")   
    DefaultSetting.objects.create(key="ch_third_unlock_follower_id", value="5")   
    DefaultSetting.objects.create(key="ch_third_unlock_follower_level", value="1")   
    DefaultSetting.objects.create(key="ad_follower_profile_exp_persent", value="0.1")   
    DefaultSetting.objects.create(key="follower_profile_bonus_percent", value="1")   
    DefaultSetting.objects.create(key="spine_load_max_count", value="0")   
    DefaultSetting.objects.create(key="log_flag", value="true")   
    DefaultSetting.objects.create(key="weather_cherry_blossom", value="false")   
    DefaultSetting.objects.create(key="active_goods_ticket_buff", value="true")   
    DefaultSetting.objects.create(key="active_fan_art_costume", value="true")   
    DefaultSetting.objects.create(key="pass_goods_sale_start_time", value="2022-02-19 00:00")   
    DefaultSetting.objects.create(key="pass_goods_sale_end_time", value="2022-02-27 23:59")   
    DefaultSetting.objects.create(key="attendacne_buff_value", value="0.01")   
    DefaultSetting.objects.create(key="attendacne_buff_limit_day", value="10000")   
    DefaultSetting.objects.create(key="log_flag_unfinished_purchase", value="true")   
    DefaultSetting.objects.create(key="jp_laws_flag", value="true")   
    
    

class Migration(migrations.Migration):
    # TODO: update dependency to the previous migration in gameapi.
    dependencies = [
        ("gameapi", "0097_seed_followerleveldata_followergiftdata"),
    ]

    operations = [
        migrations.RunPython(add_default_setting),
    ]