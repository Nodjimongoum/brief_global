from django.db import models

# Create your models here.

class client(models.Model):
    nom = models.CharField(max_length=150)
    addresse = models.CharField(max_length=100)
    sexe = models.CharField(max_length=20)
    teleplone = models.CharField(max_length=30)

# Create / Insert / Add - Post
# Retrieve / Fecth - GET
# Update / Edit - PUT
# Delete / Remove - DELETE

    

