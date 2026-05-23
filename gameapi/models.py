from django.db import models
from django.contrib.auth.models import User

# --- Core Player Model ---
class Player(models.Model):
    # Linking to Django's Auth User (optional, but recommended)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    
    # From userLoginRequestsBody & userLoginResponseBody1
    external_user_id = models.CharField(max_length=255, unique=True, db_index=True)
    device_hash = models.CharField(max_length=255)
    country_code = models.CharField(max_length=10, blank=True)
    
    nickname = models.CharField(max_length=255)
    
    # Currency & Stats (Using BigInt to prevent overflow on those i64s)
    candy_total = models.FloatField(default=0.0)        # numberOfCandy
    free_choco = models.IntegerField(default=0)
    paid_choco = models.IntegerField(default=0)
    
    # Timestamps (Stored as raw strings/ints per Thrift spec)
    created_at = models.DateTimeField() 
    last_login = models.DateTimeField() # lastLogin_da`te
    last_save = models.DateTimeField(null=True) # lastSave_date

    def __str__(self):
        return self.nickname or self.external_user_id

# --- Inventory Models (One-to-Many) ---

class Outfit(models.Model):
    player = models.ForeignKey(Player, related_name='outfits', on_delete=models.CASCADE)
    outfit_id = models.IntegerField()

class Guitar(models.Model):
    player = models.ForeignKey(Player, related_name='guitars', on_delete=models.CASCADE)
    guitar_id = models.IntegerField()

class Song(models.Model):
    player = models.ForeignKey(Player, related_name='songs', on_delete=models.CASCADE)
    song_id = models.IntegerField()
    level = models.IntegerField(default=0)
    
    # Logic fields
    has_gift = models.BooleanField(default=False) # "gifts_boolean"
    gift_sender_id = models.IntegerField(default=0)
    
    # Timestamps
    last_received_gift = models.DateTimeField()
    unlock_time = models.DateTimeField()

class CharacterLevel(models.Model):
    """
    Used for 'guitarGirlLevels' and 'followerLevels'.
    We use a 'type' field to distinguish them to avoid creating two identical tables.
    """
    TYPE_CHOICES = (('MAIN', 'Guitar Girl'), ('FOLLOWER', 'Follower'))
    
    player = models.ForeignKey(Player, related_name='character_levels', on_delete=models.CASCADE)
    char_type = models.CharField(max_length=20, choices=TYPE_CHOICES)
    
    character_index = models.IntegerField() # index
    level = models.IntegerField(default=1)
    number_of_x2 = models.IntegerField(default=0) # Rebirths/Prestige?

class SkillLevel(models.Model):
    player = models.ForeignKey(Player, related_name='skills', on_delete=models.CASCADE)
    skill_id = models.IntegerField()
    level = models.IntegerField()

class Achievement(models.Model):
    player = models.ForeignKey(Player, related_name='achievements', on_delete=models.CASCADE)
    achievement_id = models.IntegerField()
    level = models.IntegerField()
    progress = models.CharField(max_length=255) # "stringified i32"

class ItemLevel(models.Model):
    TYPE_CHOICES = (('GGI', 'Guitar Girl Item'), ('GSI', 'General Store Item'))
    
    player = models.ForeignKey(Player, related_name='items', on_delete=models.CASCADE)
    
    item_type = models.CharField(max_length=20, choices=TYPE_CHOICES)
    item_id = models.IntegerField()
    level = models.IntegerField()
    
class FolowerMessage(models.Model):
    player = models.ForeignKey(Player, related_name='follower_messages', on_delete=models.CASCADE)
    
    message_id = models.IntegerField()
    field2 = models.IntegerField() 
    field3 = models.TextField(max_length=255) 
    field4 = models.IntegerField() 

class FolowerTask(models.Model):
    player = models.ForeignKey(Player, related_name='follower_tasks', on_delete=models.CASCADE)
    
    id = models.IntegerField()
    field2 = models.IntegerField() 
    field3 = models.IntegerField() 
    task1Progress = models.FloatField() 
    task2Progress = models.FloatField() 
    task3Progress = models.FloatField() 
    task1Finished = models.IntegerField() 
    task2Finished = models.IntegerField() 
    task3Finished = models.IntegerField() 
    field10 = models.IntegerField() 
# --- Complex Data Maps ---

class ChannelProgress(models.Model):
    """
    Mapped from 'userLoginResponseGeneralUserData_map'.
    The thrift file uses a Map<i32, struct>, implying multiple chapters.
    """
    player = models.ForeignKey(Player, related_name='channel_progress', on_delete=models.CASCADE)
    channel_index = models.IntegerField() # The Key of the map (1, 2, etc)
    
    views = models.IntegerField(default=0)
    current_rank_id = models.IntegerField(default=1)
    current_outfit_id = models.IntegerField()
    current_song_id = models.IntegerField()
    current_guitar_id = models.IntegerField()
    
    # "Like for Ch1, heart for Ch2"
    hearts_or_likes_count = models.CharField(max_length=255, default="0") 
    notes_count = models.CharField(max_length=255, default="0") # Ch2 only