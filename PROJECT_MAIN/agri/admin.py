from django.contrib import admin
from agri.models import Seller,Buyer,Land,Amenities,Broker

# Register your models here.

admin.site.register(Seller)
admin.site.register(Buyer)
admin.site.register(Land)
admin.site.register(Amenities)
admin.site.register(Broker)
