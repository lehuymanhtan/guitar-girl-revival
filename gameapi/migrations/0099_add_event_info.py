from django.db import migrations


def add_event_info(apps, schema_editor):
    Event = apps.get_model("gameapi", "Event")
    EventReward = apps.get_model("gameapi", "EventReward")
    # Template: add your event rows here.
    # Example:
    # Event.objects.update_or_create(
    #     code="SUMMER_2025",
    #     defaults={
    #         "name": "Summer 2025",
    #         "start_at": "2025-06-01T00:00:00Z",
    #         "end_at": "2025-06-30T23:59:59Z",
    #         "is_active": True,
    #     },
    # )

    # TODO: add event data.
    # Event 1
    e1, _ = Event.objects.get_or_create(idx=1, defaults={'event_name': '출석부', 'event_type': 'DailyReward'})
    EventReward.objects.get_or_create(
        event=e1,
        reward_idx=1,
        defaults={
            'reward_num': 1,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 100,
            's_CustomIconType': 'DailyReward',
            's_CustomIconSprite': 'reward_01'
        }
    )
    EventReward.objects.get_or_create(
        event=e1,
        reward_idx=2,
        defaults={
            'reward_num': 2,
            'reward_type': 3,
            'reward_id': 9,
            'reward_value': 1,
            's_CustomIconType': '',
            's_CustomIconSprite': ''
        }
    )
    EventReward.objects.get_or_create(
        event=e1,
        reward_idx=3,
        defaults={
            'reward_num': 3,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 200,
            's_CustomIconType': 'DailyReward',
            's_CustomIconSprite': 'reward_03'
        }
    )
    EventReward.objects.get_or_create(
        event=e1,
        reward_idx=4,
        defaults={
            'reward_num': 4,
            'reward_type': 1,
            'reward_id': 2,
            'reward_value': 50,
            's_CustomIconType': 'DailyReward',
            's_CustomIconSprite': 'reward_04'
        }
    )
    EventReward.objects.get_or_create(
        event=e1,
        reward_idx=5,
        defaults={
            'reward_num': 5,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 300,
            's_CustomIconType': 'DailyReward',
            's_CustomIconSprite': 'reward_05'
        }
    )
    EventReward.objects.get_or_create(
        event=e1,
        reward_idx=6,
        defaults={
            'reward_num': 6,
            'reward_type': 1,
            'reward_id': 2,
            'reward_value': 50,
            's_CustomIconType': 'DailyReward',
            's_CustomIconSprite': 'reward_06'
        }
    )
    EventReward.objects.get_or_create(
        event=e1,
        reward_idx=7,
        defaults={
            'reward_num': 7,
            'reward_type': 2,
            'reward_id': 13,
            'reward_value': 1,
            's_CustomIconType': 'DailyReward',
            's_CustomIconSprite': 'reward_02'
        }
    )

    # Event 2
    e2, _ = Event.objects.get_or_create(idx=2, defaults={'event_name': '1주년 출석부', 'event_type': 'DailyReward_PeriodCheck_First'})
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=101,
        defaults={
            'reward_num': 1,
            'reward_type': 1,
            'reward_id': 2,
            'reward_value': 111,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_03'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=102,
        defaults={
            'reward_num': 2,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 365,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_02'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=103,
        defaults={
            'reward_num': 3,
            'reward_type': 9,
            'reward_id': 35,
            'reward_value': 1,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_05'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=104,
        defaults={
            'reward_num': 4,
            'reward_type': 11,
            'reward_id': 1,
            'reward_value': 111,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_04'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=105,
        defaults={
            'reward_num': 5,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 365,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_02'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=106,
        defaults={
            'reward_num': 6,
            'reward_type': 1,
            'reward_id': 11,
            'reward_value': 111,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_01'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=107,
        defaults={
            'reward_num': 7,
            'reward_type': 3,
            'reward_id': 29,
            'reward_value': 1,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_06'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=108,
        defaults={
            'reward_num': 8,
            'reward_type': 1,
            'reward_id': 2,
            'reward_value': 111,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_03'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=109,
        defaults={
            'reward_num': 9,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 365,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_02'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=110,
        defaults={
            'reward_num': 10,
            'reward_type': 9,
            'reward_id': 241,
            'reward_value': 1,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_07'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=111,
        defaults={
            'reward_num': 11,
            'reward_type': 11,
            'reward_id': 1,
            'reward_value': 365,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_04'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=112,
        defaults={
            'reward_num': 12,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 1000,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_02'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=113,
        defaults={
            'reward_num': 13,
            'reward_type': 1,
            'reward_id': 11,
            'reward_value': 365,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_01'
        }
    )
    EventReward.objects.get_or_create(
        event=e2,
        reward_idx=114,
        defaults={
            'reward_num': 14,
            'reward_type': 3,
            'reward_id': 227,
            'reward_value': 1,
            's_CustomIconType': 'YearEvent',
            's_CustomIconSprite': 'reward_08'
        }
    )

    # Event 3
    e3, _ = Event.objects.get_or_create(idx=3, defaults={'event_name': '상시 출석부', 'event_type': 'DailyAttendance'})
    EventReward.objects.get_or_create(
        event=e3,
        reward_idx=201,
        defaults={
            'reward_num': 1,
            'reward_type': 11,
            'reward_id': 1,
            'reward_value': 50,
            's_CustomIconType': 'DailyAttendanceReward',
            's_CustomIconSprite': 'reward_01'
        }
    )
    EventReward.objects.get_or_create(
        event=e3,
        reward_idx=202,
        defaults={
            'reward_num': 2,
            'reward_type': 1,
            'reward_id': 2,
            'reward_value': 30,
            's_CustomIconType': 'DailyAttendanceReward',
            's_CustomIconSprite': 'reward_02'
        }
    )
    EventReward.objects.get_or_create(
        event=e3,
        reward_idx=203,
        defaults={
            'reward_num': 3,
            'reward_type': 1,
            'reward_id': 11,
            'reward_value': 50,
            's_CustomIconType': 'DailyAttendanceReward',
            's_CustomIconSprite': 'reward_03'
        }
    )
    EventReward.objects.get_or_create(
        event=e3,
        reward_idx=204,
        defaults={
            'reward_num': 4,
            'reward_type': 11,
            'reward_id': 1,
            'reward_value': 100,
            's_CustomIconType': 'DailyAttendanceReward',
            's_CustomIconSprite': 'reward_01'
        }
    )
    EventReward.objects.get_or_create(
        event=e3,
        reward_idx=205,
        defaults={
            'reward_num': 5,
            'reward_type': 1,
            'reward_id': 2,
            'reward_value': 50,
            's_CustomIconType': 'DailyAttendanceReward',
            's_CustomIconSprite': 'reward_02'
        }
    )
    EventReward.objects.get_or_create(
        event=e3,
        reward_idx=206,
        defaults={
            'reward_num': 6,
            'reward_type': 1,
            'reward_id': 11,
            'reward_value': 100,
            's_CustomIconType': 'DailyAttendanceReward',
            's_CustomIconSprite': 'reward_03'
        }
    )
    EventReward.objects.get_or_create(
        event=e3,
        reward_idx=207,
        defaults={
            'reward_num': 7,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 150,
            's_CustomIconType': 'DailyAttendanceReward',
            's_CustomIconSprite': 'reward_04'
        }
    )

    # Event 202110
    e202110, _ = Event.objects.get_or_create(
        idx=202110,
        defaults={'event_name': '2021년 10월 로그인 출석부', 'event_type': 'DailyReward_PeriodCheck_First'}
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211001,
        defaults={
            'reward_num': 1,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 100,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_01'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211002,
        defaults={
            'reward_num': 2,
            'reward_type': 1,
            'reward_id': 8,
            'reward_value': 10000,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_02'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211003,
        defaults={
            'reward_num': 3,
            'reward_type': 1,
            'reward_id': 11,
            'reward_value': 60,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_03'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211004,
        defaults={
            'reward_num': 4,
            'reward_type': 1,
            'reward_id': 2,
            'reward_value': 200,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_04'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211005,
        defaults={
            'reward_num': 5,
            'reward_type': 11,
            'reward_id': 1,
            'reward_value': 100,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_05'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211006,
        defaults={
            'reward_num': 6,
            'reward_type': 1,
            'reward_id': 11,
            'reward_value': 60,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_03'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211007,
        defaults={
            'reward_num': 7,
            'reward_type': 9,
            'reward_id': 36,
            'reward_value': 1,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_06'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211008,
        defaults={
            'reward_num': 8,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 100,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_01'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211009,
        defaults={
            'reward_num': 9,
            'reward_type': 1,
            'reward_id': 8,
            'reward_value': 10000,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_02'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211010,
        defaults={
            'reward_num': 10,
            'reward_type': 1,
            'reward_id': 11,
            'reward_value': 60,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_03'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211011,
        defaults={
            'reward_num': 11,
            'reward_type': 1,
            'reward_id': 2,
            'reward_value': 200,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_04'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211012,
        defaults={
            'reward_num': 12,
            'reward_type': 11,
            'reward_id': 1,
            'reward_value': 100,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_05'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211013,
        defaults={
            'reward_num': 13,
            'reward_type': 1,
            'reward_id': 1,
            'reward_value': 100,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_01'
        }
    )
    EventReward.objects.get_or_create(
        event=e202110,
        reward_idx=20211014,
        defaults={
            'reward_num': 14,
            'reward_type': 3,
            'reward_id': 30,
            'reward_value': 1,
            's_CustomIconType': 'LoginEvent_2021_10',
            's_CustomIconSprite': 'reward_07'
        }
    )

    # Event 202111
    e202111, _ = Event.objects.get_or_create(
        idx=202111,
        defaults={'event_name': '2021년 11월 로그인 이벤트 (신규 유저 선택 보상),\n2022년 1월 로그인 이벤트 (신규 유저 선택 보상)', 'event_type': 'DailyReward_Select_NewUser'}
    )
    EventReward.objects.get_or_create(
        event=e202111,
        reward_idx=20211101,
        defaults={
            'reward_num': 1,
            'reward_type': 0,
            'reward_id': 0,
            'reward_value': 0,
            's_CustomIconType': '',
            's_CustomIconSprite': ''
        }
    )
    EventReward.objects.get_or_create(
        event=e202111,
        reward_idx=20211102,
        defaults={
            'reward_num': 2,
            'reward_type': 0,
            'reward_id': 0,
            'reward_value': 0,
            's_CustomIconType': '',
            's_CustomIconSprite': ''
        }
    )
    EventReward.objects.get_or_create(
        event=e202111,
        reward_idx=20211103,
        defaults={
            'reward_num': 3,
            'reward_type': 0,
            'reward_id': 0,
            'reward_value': 0,
            's_CustomIconType': '',
            's_CustomIconSprite': ''
        }
    )
    EventReward.objects.get_or_create(
        event=e202111,
        reward_idx=20211104,
        defaults={
            'reward_num': 4,
            'reward_type': 0,
            'reward_id': 0,
            'reward_value': 0,
            's_CustomIconType': '',
            's_CustomIconSprite': ''
        }
    )
    EventReward.objects.get_or_create(
        event=e202111,
        reward_idx=20211105,
        defaults={
            'reward_num': 5,
            'reward_type': 0,
            'reward_id': 0,
            'reward_value': 0,
            's_CustomIconType': '',
            's_CustomIconSprite': ''
        }
    )
    EventReward.objects.get_or_create(
        event=e202111,
        reward_idx=20211106,
        defaults={
            'reward_num': 6,
            'reward_type': 0,
            'reward_id': 0,
            'reward_value': 0,
            's_CustomIconType': '',
            's_CustomIconSprite': ''
        }
    )
    EventReward.objects.get_or_create(
        event=e202111,
        reward_idx=20211107,
        defaults={
            'reward_num': 7,
            'reward_type': 13,
            'reward_id': 10,
            'reward_value': 1,
            's_CustomIconType': '',
            's_CustomIconSprite': ''
        }
    )


# def reverse_event_info(apps, schema_editor):
#     Event = apps.get_model("gameapi", "Event")

#     # Template: remove rows added in populate_event_info.
#     # Example:
#     # Event.objects.filter(code="SUMMER_2025").delete()

#     # TODO: add manual cleanup if needed.
#     pass


class Migration(migrations.Migration):
    dependencies = [
        ("gameapi", "0098_default_setting"),
    ]

    operations = [
        migrations.RunPython(add_event_info),
    ]
