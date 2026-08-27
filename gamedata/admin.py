from django.contrib import admin
from django.apps import apps
from django.db import models

# Register all models from gamedata app
app = apps.get_app_config('gamedata')

for model_name, model in app.models.items():
    class CustomModelAdmin(admin.ModelAdmin):
        # Display all fields in the list view except the auto-generated id
        # You can limit this if a model has too many fields
        list_display = [field.name for field in model._meta.get_fields() if field.name != 'id']
        # Make the first non-id field clickable to go to the edit page
        if list_display:
            list_display_links = (list_display[0],)
            
        search_fields = [field.name for field in model._meta.get_fields() if isinstance(field, (models.CharField, models.TextField))] if hasattr(models, 'CharField') else []
        
    admin.site.register(model, CustomModelAdmin)
