from django.core.management.base import BaseCommand
import json
import os
import gamedata.models as models

from django.apps import apps

class Command(BaseCommand):
    help = 'Import game data from JSON files in gameapi/master_data'

    def handle(self, *args, **options):
        data_dir = os.path.abspath('gamedata/master_data')
        
        # Get all model classes for 'gamedata' app
        model_classes = {model.__name__.lower(): model for model in apps.get_app_config('gamedata').get_models()}
        
        for filename in os.listdir(data_dir):
            if not filename.endswith('.json'):
                continue
                
            base_name = filename[:-5].lower().replace('_', '')
            
            # Find matching model
            target_model = None
            if base_name + 'data' in model_classes:
                target_model = model_classes[base_name + 'data']
            elif base_name in model_classes:
                target_model = model_classes[base_name]
            
            if not target_model:
                self.stdout.write(self.style.WARNING(f'No model found for {filename}'))
                continue
                
            with open(os.path.join(data_dir, filename), 'r', encoding='utf-8') as f:
                try:
                    data = json.load(f)
                except json.JSONDecodeError:
                    self.stdout.write(self.style.ERROR(f'Failed to parse {filename}'))
                    continue
                    
            if not isinstance(data, list):
                self.stdout.write(self.style.WARNING(f'{filename} does not contain a list'))
                continue
                
            valid_fields = [f.name for f in target_model._meta.get_fields()]
            
            target_model.objects.all().delete()
            
            instances = []
            for item in data:
                model_kwargs = {}
                for k, v in item.items():
                    if k in valid_fields:
                        # Ensure empty strings are handled if they need to be integers/floats?
                        # Django might auto-convert or throw error. Let's let it run and see.
                        model_kwargs[k] = v
                
                instances.append(target_model(**model_kwargs))
                
            try:
                target_model.objects.bulk_create(instances)
                self.stdout.write(self.style.SUCCESS(f'Successfully imported {len(instances)} records into {target_model.__name__}'))
            except Exception as e:
                self.stdout.write(self.style.ERROR(f'Failed to import {filename} into {target_model.__name__}: {e}'))
