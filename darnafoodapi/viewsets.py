from rest_framework import viewsets
from . import models
from . import serializers

class clientViewset(viewsets.ModelViewSet):
    queryset = models.client.objects.all()
    serializer_class = serializers.clientSerializer